Release 1: Research Web Servers

(2)
The "Linux Way" is dervied from the philosophy behind the UNIX system. Some core tenets behind its development include the following ideas:
-Use programs that only do one task, but do it well.
-To accomplish complex tasks, use severl linked together programs.
-There is no "one true way" to do anything.
-Preference of commandline tools over graphical tools.

Also notable is that Linux is open-source and free for all users. With this in mind, Linux allows the freedom to study, modify, and distribute altered copies to others to encourage freedom of choice for its community. Some other concepts that have largely influenced Linux's evolution include: 
-Standard-based: this feature was included to ensure compatability with other systems.
-Modularity: allows for the ability to incorporate new features without breaking existing functionality or needing a re-install.
-Backward-compatibility: enables older hardware, software, and documents to be used with newer versions of Linux.

(3)
A virtual private server (VPS) is a virtual machine (emulated computer system) that is sold to developers from an Internet hosting service. In many ways they are functionally similar to a physical server, with the main caveat of being software-defined. 

Some advantages VPS have over physical servers is the ability to be easily created, configured, or destroyed if necessary, thus allowing for much greater safety or reckless behavior. Additionally, VPS are much lower priced relative to physical servers especially since optimizing for miniumn specifications is easier. On a similar note, virtual servers allow for an overall more efficient allocation of resources from economies of scale, time-sharing, and partitioning. Also scalaiblity is much easier with a VPS. Finally, VPS allows for more control over the server, allowing root access and don't have as many security limitations.

(4)
The main issue with running programs on Linux as the root user is security. When used as a web server, allowing root access basically enables a attacker to also gain root access by exploiting a bug then creating another user with the same UID as root. 