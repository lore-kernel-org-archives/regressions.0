Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C4019B
	for <regressions@lists.linux.dev>; Sat, 25 Feb 2023 13:34:17 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pVugl-00040o-JH; Sat, 25 Feb 2023 14:34:11 +0100
Message-ID: <643054d9-5f96-b6d3-8ea4-a5feb9f094d7@leemhuis.info>
Date: Sat, 25 Feb 2023 14:34:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Pavel Machek <pavel@ucw.cz>
Cc: Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <fabdb45fa44db2531f0dbe5e88545c49dfb87040.1675252073.git.linux@leemhuis.info>
 <Y/nSJvm6h4Sq5PR2@duo.ucw.cz>
 <1c222195-8fec-5067-c382-78dfd2505974@leemhuis.info>
Content-Language: en-US, de-DE
Subject: Re: [PATCH v1] docs: describe how to quickly build Linux
In-Reply-To: <1c222195-8fec-5067-c382-78dfd2505974@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1677332057;4130db7c;
X-HE-SMSGID: 1pVugl-00040o-JH

On 25.02.23 10:29, Thorsten Leemhuis wrote:
> On 25.02.23 10:17, Pavel Machek wrote:
>
>>> +       mkdir ~/linux/ ~/linux/sources ~/linux/build
>>> +       git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git \
>>> +         ~/linux/sources
>>> +       cd ~/linux/sources/
>>> +       # hint: if you don't want to build any stable or longterm kernels, skip the
>>> +       #   next two commands
>>> +       git remote add linux-stable \
>>> +         https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>>> +       git fetch --all
>>> +       # hint: if you want to apply patches, do it at this point (see below for details)
>>> +       # hint: at this point it's recommended to tag your build (see below for details)
>>> +       yes "" | make O=~/linux/build/ localmodconfig
>>> +       # hint: at this point you might want or have to adjust the build configuration
>>> +       #  (see below for details)
>>> +       # note: if you are running a Debian kernel, you'll have to adjust the configuration
>>> +       #  at this point (see below)
>>> +       make -j $(nproc --all) O=~/linux/build/
>>
>> Is the complexity of using O= worth it for one-off kernel builds?
> 
> That is a good question. I seemed like the right thing to do when I
> started writing this guide (maybe just because I've been doing it that
> way for ages), but now that you ask I'm unsure myself.
> 
> /me wonders how others feel about it

/me should have pondered with the idea for more time before writing aboe
mail, because:

Having thought about this some more, I decided to drop it, the
complexity really is not worth it.

Many thx for the suggestion!

Ciao, Thorsten
