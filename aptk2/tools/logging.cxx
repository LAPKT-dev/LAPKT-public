
#include <iostream>

#include <boost/filesystem.hpp>
#include <boost/format.hpp>


#include <aptk2/tools/logging.hxx>

namespace aptk {
	
std::unique_ptr<Logger> Logger::_instance = nullptr;

void
Logger::init(const std::string& directory) {
	_instance = std::unique_ptr<Logger>(new Logger(directory));
}
	
Logger&
Logger::instance() {
	if (!_instance) throw std::runtime_error("You need to explicitly initialize the aptk::Logger singleton instance before using it");
	return *_instance;
}
	
Logger::Logger(const std::string& directory)
	: _directory(directory) , _timer()
{
	if(_directory.empty()) throw std::runtime_error("Empty logging directory specified");
	boost::filesystem::create_directory(_directory);
	
	// We insert a special logger to output to cout
	_streams.insert(std::make_pair(std::string("cout"), &(std::cout)));
}


Logger::~Logger() {
	for(auto it:_streams) {
		auto stream = it.second;
		if (auto ofstream = dynamic_cast<std::ofstream*>(stream)) {
			ofstream->close();
		}
		
		if (stream != &(std::cout)) delete stream;
	}
}

std::ostream&
Logger::log(const std::string& filename) {
	auto it = _streams.find(filename);
	
	if(it == _streams.end()) {  // create a new file if it wasn't previously there
		std::string full = _directory + "/" + filename + ".log";
		auto res = _streams.insert(std::make_pair(filename, new std::ofstream(full.c_str())));
		it = res.first;
	}
	return *(it->second);
}

std::ostream&
Logger::log(const std::string& level, const std::string& filename) {
	boost::timer::cpu_times elapsed = _timer.elapsed();
	std::ostream& stream = log(filename);
	
	// Append the log level
	stream  << "[" << level << "]";
	
	// Append the time
	stream  << "[" << boost::format("%8.5f") % (elapsed.wall / 1e9) << "]";
	
	// Append a space for readability
	stream << " ";
	return stream;
}

} // namespaces
