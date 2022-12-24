Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1E87B
	for <regressions@lists.linux.dev>; Sat, 24 Dec 2022 07:57:21 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p8zPD-00053q-7v; Sat, 24 Dec 2022 08:57:19 +0100
Message-ID: <bd71c228-4495-cc68-7bcf-1f48edb92947@leemhuis.info>
Date: Sat, 24 Dec 2022 08:57:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Possible regression with kernel 6.1.0 freezing (6.0.14 is fine)
 on haswell laptop #forregzbot
Content-Language: en-US, de-DE
To: stable@vger.kernel.org, regressions@lists.linux.dev
References: <cb697d4e-406b-169b-c595-6521f8481304@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <cb697d4e-406b-169b-c595-6521f8481304@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671868641;b1b6f498;
X-HE-SMSGID: 1p8zPD-00053q-7v

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 23.12.22 15:13, Sergio Callegari wrote:
> 
> just a short note to report regular freezes with kernel 6.1.0 on a
> haswell laptop quad core Intel Core i7-4750HQ (-MT MCP-) with integrated
> graphics.

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced v6.0..v6.1
#regzbot title hangs and data corruption on haswell laptop hangs when
running with GUI
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.


> - system only freezes when launching the desktop environment (working on
> a text console while having the sddm login screen up, without logging
> in, does not seem to cause the issue);
> 
> - freezes happens a few seconds to a few minutes after getting to the
> desktop environment (that uses opengl and composition). Freeze happens
> both on X11 or Wayland.
> 
> - freeze seems to cause data loss (system not able to complete writes
> when the freeze occurs, data structures on disk get corrupted, e.g.
> system complained on broken btrfs snapshots made by timeshift-like app).
> 
> - system on freeze ceases responding to ping from the outside;
> 
> - upon reboot I cannot find any trace of any issue in the journal;
> 
> - on the same system booting kernels up to 6.0.14 is OK.
> 
> Seen using a distro kernel, but it should be fairly mainline
> (manjaro/arch).
> 
> Reported to the distro, but seems serious enough to report here too.
