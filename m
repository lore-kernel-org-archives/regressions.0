Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD961110
	for <regressions@lists.linux.dev>; Wed, 26 Oct 2022 12:20:49 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1onfOp-0000Mf-V2; Wed, 26 Oct 2022 14:20:48 +0200
Message-ID: <63294047-20e7-6ff2-01b8-a267b0ecb4af@leemhuis.info>
Date: Wed, 26 Oct 2022 14:20:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [REGRESSION] introduced in 5.10.140 causes drives to drop from
 LSI SAS controller (Bisected to 6d17a112e9a63ff6a5edffd1676b99e0ffbcd269)
 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
Cc: stable@vger.kernel.org, linux-scsi@vger.kernel.org
References: <CADy0EvLGJmZe-x9wzWSB6+tDKNuLHd8Km3J5MiWWYQRR2ctS3A@mail.gmail.com>
 <350ec615-ffe8-2e0e-149d-4bf45932a585@acm.org>
 <ddec1a2f-1d55-ac42-9877-0d7119d087cd@leemhuis.info>
In-Reply-To: <ddec1a2f-1d55-ac42-9877-0d7119d087cd@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666786850;daa06636;
X-HE-SMSGID: 1onfOp-0000Mf-V2

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

On 22.09.22 13:38, Thorsten Leemhuis wrote:
>
> Hmm, nothing happened here for a week. :-/ That's not how this should be
> when it comes to regressions...
> 
> Jason, any news on this? 

#regzbot invalid: reporter MIA
