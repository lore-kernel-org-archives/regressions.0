Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E497C
	for <regressions@lists.linux.dev>; Sat, 25 Feb 2023 09:29:22 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pVqrh-0000TL-HG; Sat, 25 Feb 2023 10:29:13 +0100
Message-ID: <1c222195-8fec-5067-c382-78dfd2505974@leemhuis.info>
Date: Sat, 25 Feb 2023 10:29:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Pavel Machek <pavel@ucw.cz>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <Y/nSJvm6h4Sq5PR2@duo.ucw.cz>
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
In-Reply-To: <Y/nSJvm6h4Sq5PR2@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1677317362;eb7661d1;
X-HE-SMSGID: 1pVqrh-0000TL-HG

On 25.02.23 10:17, Pavel Machek wrote:
>> +If your platform uses techniques like Secure Boot, prepare the system to permit
>> +starting self-compiled Linux kernels; install compilers and everything else
>> +needed for building Linux; make sure to have 15 Gigabyte free space in your home
>> +directory. Now run the following commands to download the sources of Linux,
>> +which you then use to configure, build and install your own
>> kernel::
> 
> 15GB is quite a lot. Maybe the shallow clone should be given another
> chance?

It got and made it, see v2:
https://lore.kernel.org/all/8cfcf069d48c1b8d7b83aafe0132f8dad0f1d0ea.1676400947.git.linux@leemhuis.info/

>> +       mkdir ~/linux/ ~/linux/sources ~/linux/build
>> +       git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git \
>> +         ~/linux/sources
>> +       cd ~/linux/sources/
>> +       # hint: if you don't want to build any stable or longterm kernels, skip the
>> +       #   next two commands
>> +       git remote add linux-stable \
>> +         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> +       git fetch --all
>> +       # hint: if you want to apply patches, do it at this point (see below for details)
>> +       # hint: at this point it's recommended to tag your build (see below for details)
>> +       yes "" | make O=~/linux/build/ localmodconfig
>> +       # hint: at this point you might want or have to adjust the build configuration
>> +       #  (see below for details)
>> +       # note: if you are running a Debian kernel, you'll have to adjust the configuration
>> +       #  at this point (see below)
>> +       make -j $(nproc --all) O=~/linux/build/
> 
> Is the complexity of using O= worth it for one-off kernel builds?

That is a good question. I seemed like the right thing to do when I
started writing this guide (maybe just because I've been doing it that
way for ages), but now that you ask I'm unsure myself.

/me wonders how others feel about it

Ciao, Thorsten
