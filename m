Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A8DC8F5
	for <regressions@lists.linux.dev>; Tue,  5 Sep 2023 12:10:07 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qdUsf-0006J5-Ge; Tue, 05 Sep 2023 14:10:05 +0200
Message-ID: <1d79cc64-46d8-42ab-8219-e45e8d19532f@leemhuis.info>
Date: Tue, 5 Sep 2023 14:10:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Don't fill the kernel log with memfd_create messages
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: stable@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <1693408388.rwssx8r1h9.none.ref@localhost>
 <1693408388.rwssx8r1h9.none@localhost>
 <14b4a922-a31a-a329-0264-3d8bd101ee6b@suse.cz>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <14b4a922-a31a-a329-0264-3d8bd101ee6b@suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693915808;9089eb30;
X-HE-SMSGID: 1qdUsf-0006J5-Ge

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 04.09.23 15:31, Vlastimil Babka wrote:
> On 8/30/23 17:52, Alex Xu (Hello71) wrote:
>> Hi all,
>>
>> Recently "memfd: improve userspace warnings for missing exec-related 
>> flags" was merged. On my system, this is a regression, not an 
>> improvement, because the entire 256k kernel log buffer (default on x86) 
>> is filled with these warnings and "__do_sys_memfd_create: 122 callbacks 
>> suppressed". I haven't investigated too closely, but the most likely 
>> cause is Wayland libraries.
>>
>> This is too serious of a consequence for using an old API, especially 
>> considering how recently the flags were added. The vast majority of 
>> software has not had time to add the flags: glibc does not define the 
>> macros until 2.38 which was released less than one month ago, man-pages 
>> does not document the flags, and according to Debian Code Search, only 
>> systemd, stress-ng, and strace actually pass either of these flags.
>>
>> Furthermore, since old kernels reject unknown flags, it's not just a 
>> matter of defining and passing the flag; every program needs to 
>> add logic to handle EINVAL and try again.
>>
>> Some other way needs to be found to encourage userspace to add the 
>> flags; otherwise, this message will be patched out because the kernel 
>> log becomes unusable after running unupdated programs, which will still 
>> exist even after upstreams are fixed. In particular, AppImages, 
>> flatpaks, snaps, and similar app bundles contain vendored Wayland 
>> libraries which can be difficult or impossible to update.
> 
> It's being reverted:
> https://lore.kernel.org/all/20230902230530.6B663C433C8@smtp.kernel.org/

in that case:

#regzbot fix: revert "memfd: improve userspace warnings for missing
exec-related flags".
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
