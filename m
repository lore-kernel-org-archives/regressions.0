Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6467EF
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 05:38:39 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pWsh7-0004NB-VD; Tue, 28 Feb 2023 06:38:34 +0100
Message-ID: <4e9cdfbd-9e9e-449c-a4e4-fe22021c7187@leemhuis.info>
Date: Tue, 28 Feb 2023 06:38:33 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] vc_screen: don't clobber return value in vcs_read
Content-Language: en-US, de-DE
To: George Kennedy <george.kennedy@oracle.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>,
 Storm Dragon <stormdragon2976@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, sfr@canb.auug.org.au,
 akpm@linux-foundation.org, linux-serial@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <Y/KtG9vK0oz0nQrN@hotmail.com>
 <20230220064612.1783-1-linux@weissschuh.net>
 <dcaaf7d5-b2d5-dbb9-f3fe-2232ee525cc8@kernel.org>
 <2094ecec-f63c-4e8a-ba97-da77c5266da1@t-8ch.de>
 <2941c2b9-5fa5-e25c-dcd0-ab9c9c0f143e@oracle.com>
 <Y/TMH8Hf6zBrC3yc@kroah.com>
 <9e297f30-dc8c-ecac-f7a6-348ddbd4b928@leemhuis.info>
 <c0d99436-28a0-d012-646d-251a9511e76f@oracle.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <c0d99436-28a0-d012-646d-251a9511e76f@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677562720;e1ab0d66;
X-HE-SMSGID: 1pWsh7-0004NB-VD

On 27.02.23 20:59, George Kennedy wrote:
> Hello Thomas,
> 
> On 2/27/2023 9:20 AM, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Hi, this is your Linux kernel regression tracker. Top-posting for once,
>> to make this easily accessible to everyone.
>>
>> George, is there anything we can do to help you moving forward to
>> finally get this regression fixed? It seems (or am I missing something?)
>> everyone is waiting for you (see below) to act on the feedback Jiri
>> provided here:
>>
>> https://lore.kernel.org/lkml/8dffe187-240d-746e-ed84-885ffd2785f6@kernel.org/
>>
>> Side note: would be good to add a "Link:" tag pointing to the start of
>> this thread as well, but that's just a detail.
> 
> I just sent the requested patch up for review.
> 
> https://lore.kernel.org/lkml/1677527001-17459-1-git-send-email-george.kennedy@oracle.com/

Thx for handling this!

And I see it very quickly made its way to mainline. :-D

Ciao, Thorsten

>> On 21.02.23 14:50, Greg Kroah-Hartman wrote:
>>> On Tue, Feb 21, 2023 at 08:30:11AM -0500, George Kennedy wrote:
>>>> On 2/20/2023 11:34 AM, Thomas Weißschuh wrote:
>>>>> +Cc people who were involved in the original thread.
>>>>>
>>>>> On Mon, Feb 20, 2023 at 12:48:59PM +0100, Jiri Slaby wrote:
>>>>>> On 20. 02. 23, 7:46, linux@weissschuh.net wrote:
>>>>>>> From: Thomas Weißschuh <linux@weissschuh.net>
>>>>>>>
>>>>>>> Commit 226fae124b2d
>>>>>>> ("vc_screen: move load of struct vc_data pointer in vcs_read() to
>>>>>>> avoid UAF")
>>>>>>> moved the call to vcs_vc() into the loop.
>>>>>>> While doing this it also moved the unconditional assignment of
>>>>>>> "ret = -ENXIO".
>>>>>>> This unconditional assignment was valid outside the loop but
>>>>>>> within it
>>>>>>> it clobbers the actual value of ret.
>>>>>>>
>>>>>>> To avoid this only assign "ret = -ENXIO" when actually needed.
>>>>>> Not sure -- I cannot find it -- but hasn't George fixed this yet?
>>>>> Indeed there was a proposed fix at
>>>>> https://lore.kernel.org/lkml/1675704844-17228-1-git-send-email-george.kennedy@oracle.com/
>>>>>
>>>>> Linus had some suggestions so it was not applied as is.
>>>>>
>>>>> I'm not sure what the current state is.
>>>>> George, do you have something in the pipeline?
>>>> Yes, that is in the pipeline:
>>>> https://lore.kernel.org/lkml/1675774098-17722-1-git-send-email-george.kennedy@oracle.com/
>>>>
>>>> Linus suggested the fix, which was tested and submitted.
>>>>
>>>> Jiri commented on the patch, which I believe was directed at Linus
>>>> as he
>>>> suggested the fix.
>>> And I was waiting for a new version from you based on those comments :(
>>>
>>> Can you fix that up and send?
>>>
>>> thanks,
>>>
>>> greg k-h
>> #regzbot monitor:
>> https://lore.kernel.org/lkml/1675774098-17722-1-git-send-email-george.kennedy@oracle.com/
>> #regzbot poke
> 
> 
> 
