Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315F923C1
	for <regressions@lists.linux.dev>; Wed, 16 Feb 2022 09:34:43 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nKGht-0005cV-Dy; Wed, 16 Feb 2022 10:34:41 +0100
Message-ID: <6be286ae-5fdd-5545-c35c-3443e07f76c5@leemhuis.info>
Date: Wed, 16 Feb 2022 10:34:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Regression 5.17-rc2] Symlink on NFS mount to directory on other
 NFS mount not resolved on first access #forregzbot
Content-Language: en-BS
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <bd2075f0-2343-5bfa-83bf-0e916303727d@molgen.mpg.de>
 <0235e04a-18aa-ccbf-f520-38a2d55e8b54@molgen.mpg.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <0235e04a-18aa-ccbf-f520-38a2d55e8b54@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645004083;99605a11;
X-HE-SMSGID: 1nKGht-0005cV-Dy

for the record:

#regzbot fixed-by: e0caaf75d443e02e55e146fd75fe2efc8aed5540

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=e0caaf75d443e02e55e146fd75fe2efc8aed5540

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 08.02.22 19:13, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Am 08.02.22 um 15:36 schrieb Paul Menzel:
>> #regzbot introduced: ac795161c93699d600db16c1a8cc23a65a1eceaf
> 
> 
>> Commit ac795161c936 (NFSv4: Handle case where the lookup of a
>> directory fails) [1], part of Linux since 5.17-rc2, introduced a
>> regression, where a symbolic link on an NFS mount to a directory on
>> another NFS does not resolve(?) the first time it is accessed:
> 
> I forgot to include, that we are using autofs/automount for these
> directories.
> 
>> ```
>> $ ls -dl /src/mariux/beeroot/build-archives
>> lrwxrwxrwx 1 root root 39 May  5  2021
>> /src/mariux/beeroot/build-archives ->
>> /src/mariux_data/beeroot/build-archives
>> $ df /src/mariux{,_data}
>> Filesystem                                           1K-blocks Used  
>> Available Use% Mounted on
>> macheteinfach:/amd/macheteinfach/1/src/mariux      17575970816
>> 2930189312 14645781504  17% /src/mariux
>> macheteinfach:/amd/macheteinfach/1/src/mariux_data 17575970816
>> 2930189312 14645781504  17% /src/mariux_data
>>
>> $ sudo umount /src/mariux /src/mariux_data
>> $ echo /src/mariux/beeroot/build-archives/*5.17*
>> /src/mariux/beeroot/build-archives/*5.17*
>> $ strace -e openat echo /src/mariux/beeroot/build-archives/*5.17*
>> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
>> openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
>> openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC)
>> = 3
>> /src/mariux/beeroot/build-archives/*5.17*
>> +++ exited with 0 +++
>> $ echo /src/mariux/beeroot/build-archives/*5.17*
>> /src/mariux/beeroot/build-archives/linux-5.17_rc1-423.x86_64.beebuild.tar.bz2
>> /src/mariux/beeroot/build-archives/linux-5.17_rc2-424.x86_64.beebuild.tar.bz2
>> /src/mariux/beeroot/build-archives/linux-5.17_rc3-426.x86_64.beebuild.tar.bz2
>> /src/mariux/beeroot/build-archives/mariux64-caret_R-3.0.2-5.17_7-0.x86_64.beebuild.tar.bz2
>>
>>
>> Using a dot in the path works around the issue:
>>
>> ```
>> $ sudo umount /src/mariux /src/mariux_data
>> $ strace -e openat echo /src/mariux/beeroot/build-archives/./*5.17*
>> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
>> openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
>> openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC)
>> = 3
>> /src/mariux/beeroot/build-archives/./linux-5.17_rc1-423.x86_64.beebuild.tar.bz2
>> /src/mariux/beeroot/build-archives/./linux-5.17_rc2-424.x86_64.beebuild.tar.bz2
>> /src/mariux/beeroot/build-archives/./linux-5.17_rc3-426.x86_64.beebuild.tar.bz2
>> /src/mariux/beeroot/build-archives/./mariux64-caret_R-3.0.2-5.17_7-0.x86_64.beebuild.tar.bz2
>>
>> +++ exited with 0 +++
>> ```
> 
> 
> Kind regards,
> 
> Paul
> 
> 
>> [1]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ac795161c93699d600db16c1a8cc23a65a1eceaf
> 
> 
> 
