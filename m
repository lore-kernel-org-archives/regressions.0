Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3826A2F58
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 11:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qojUI-0006Lx-Bk; Fri, 06 Oct 2023 13:59:22 +0200
Message-ID: <62e54bf9-18fe-41cb-86d4-20f24074d267@leemhuis.info>
Date: Fri, 6 Oct 2023 13:59:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo Yoga Slim
 7 Pro 14ARH7 82UU
Content-Language: en-US, de-DE
To: Markus Meier <kerneldev@epic-bytes.net>, alsa-devel@alsa-project.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Mark Brown <broonie@kernel.org>, Sven Frotscher <sven.frotscher@gmail.com>,
 August Wikerfors <git@augustwikerfors.se>
References: <10347605.nUPlyArG6x@kali>
 <aa54a70c-e7fc-4ca2-9a4d-425675ed0be3@leemhuis.info>
 <4836369.GXAFRqVoOG@mobile>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <4836369.GXAFRqVoOG@mobile>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1696593565;5eacbf86;
X-HE-SMSGID: 1qojUI-0006Lx-Bk

On 03.10.23 17:04, Markus Meier wrote:
> Am Dienstag, 3. Oktober 2023, 12:24:56 CEST schrieben Sie:
>> On 02.10.23 23:04, Markus Meier wrote:
>>> I own a  Lenovo Yoga Slim 7 Pro 14ARH7 where the microphone is not showing
>>> up. I added the system to the quirk table and the mic is working
>>> correctly (but with very low volume) now.
> [...]
>> I CCed a bunch of lists and people to make sure everyone is aware of
>> that patch, as it otherwise might fall through the cracks.
>>
>> Markus, quick question: do you have (a) an interest in contributing a
>> change to Linux or (b) did you just post this because Mario asked you to
>> do so in https://bugzilla.kernel.org/show_bug.cgi?id=217063#c25 ?
> 
> Nope I don't plan to become some kind of kernel developer. I just want to use 
> my notebook without any issues and want to help others who want to use this 
> device with Linux too. I just followed Mario's suggestions. I thought it would 
> be easier for everyone when I create a patch, try if it works and then submit 
> it to a bugtracker to get the bug fixed.

And that's good, as that way we know that the fix works, so many thx for
it. It's just that the patch description needs to be more like the
following.

"""
The 82UU (Lenovo Yoga Slim 7 Pro 14ARH7) requires an entry in the quirk
list to enable the internal microphone, just like many other Lenovo 82*
devices recently added.

Fixes: c008323fe361 ("ASoC: amd: yc: Fix a non-functional mic on Lenovo
82SJ")
Cc: stable@vger.kernel.org
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217063#c23
"""

Add another line right below with your sign-off, as explained here:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

Then send it again. The patch likely must be inline (but maybe Mark
accepts attached patches as well, not sure, some maintainers do).

If you want the easy way out, just reply to your mail that started this
thread (with me in CC) with a signed-off-by tag for the patch, then I'll
handle the rest.

> [...]
> Thanks for your help Thorsten. I really enjoyed your Heise Kernel-Log series 
> and I really miss those series. Was always a pleasure to read that.

Thx, great to hear!

Ciao, Thorsten
