Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995E2185C
	for <regressions@lists.linux.dev>; Mon, 15 Aug 2022 12:34:19 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oNZIO-00044g-4S; Mon, 15 Aug 2022 14:34:16 +0200
Message-ID: <fea58a8e-dbe1-56fd-eb43-1d893a93785f@leemhuis.info>
Date: Mon, 15 Aug 2022 14:34:15 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [REGRESSION] recent changes to copy_file_range behavior breakage
 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
References: <YtTM8GYn0/HkSoet@squish.home.loc>
 <c6ef3d55-bd54-435f-52f3-e1ce5842f33a@leemhuis.info>
In-Reply-To: <c6ef3d55-bd54-435f-52f3-e1ce5842f33a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1660566859;2ff92b3c;
X-HE-SMSGID: 1oNZIO-00044g-4S

On 18.07.22 13:42, Thorsten Leemhuis wrote:
> On 18.07.22 05:01, Paul Thompson wrote:
>> 	Something that worked in 5.18.9 no longer does in 5.18.1[01] and 5.19-rc6.
>>
>> 	Using the example code in the man page for copy_file_range:
>>
>> # ./copy-file-range testfile-on-ext4 /path-to-another-ext4/testfile (or symlink thereto)
>>
>> Works in 5.18.9, fails with:
>>
>> # copy_file_range: Invalid cross-device link
>>
>> And produces garbage file at destination on newer (5.18.10+) kernels.
>>
>> 	This breaks eg. qbittorrent (moving a distro image across ext4
>> filesystems, or following such a symlink) So potentially other real world
>> applications. I do not know if the reason for the commit overrides this
>> breakage, but it caused me a bit of a headache.
>
> FWIW, that's 868f9f2f8e004bfe0d3935b1976f625b2924893b in mainline.

#regzbot invalid: This seems to be a "damned if you do, damned if you
don't"
https://lore.kernel.org/lkml/CAHk-=wjZ8snqJmoyhHjZCYVP5bMmNWzQMkDZ6LtNr1YKEg4A9w@mail.gmail.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
