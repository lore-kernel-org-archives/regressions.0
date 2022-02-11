Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C42C9C
	for <regressions@lists.linux.dev>; Fri, 11 Feb 2022 08:29:50 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aebe1.dynamic.kabel-deutschland.de [95.90.235.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A9EC261EA1926;
	Fri, 11 Feb 2022 09:29:41 +0100 (CET)
Message-ID: <1c1e4143-0750-3dc5-eb63-2e8f52699e7c@molgen.mpg.de>
Date: Fri, 11 Feb 2022 09:29:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: Unable to transfer big files to Nokia N9
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>
References: <eb6d86eb-d156-d7ac-0965-181719023d51@molgen.mpg.de>
 <CABBYNZLENxvXMCh6XbBSnu0jasV1F0QestEK5v2mnNUpJdw3Vw@mail.gmail.com>
 <cf71bdea-ec22-e4c9-016c-69e94a130607@molgen.mpg.de>
 <a93c0fa7-7b84-6aea-265b-c913e0c84678@molgen.mpg.de>
 <d7206e12-1b99-c3be-84f4-df22af427ef5@molgen.mpg.de>
 <371027df-7f32-edab-208d-d4cdd2202ba6@leemhuis.info>
 <d41d8b41-c347-47e7-e52b-39d7211c8952@molgen.mpg.de>
 <aa3ee7ac-6c52-3861-1798-3cc1a37f6ebf@molgen.mpg.de>
 <9cb4b1ae-760f-f8ec-b3fe-a5d0be0dba25@leemhuis.info>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <9cb4b1ae-760f-f8ec-b3fe-a5d0be0dba25@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Thorsten,


Am 10.02.22 um 11:36 schrieb Thorsten Leemhuis:
> Hi, this is your Linux kernel regression tracker speaking. Top-posting
> for once, to make this easy accessible to everyone.
> 
> Hey bluetooth-maintainers, what's the status here? I already asked for a
> status update more that a week ago and didn't get a reply. Paul also
> confirmed recently the issue is still present and no reply either. IOW:
> this is talking way to long for a issue that was bisected?
> 
> Could you please comment on this? What can be done to get this rolling?
> Or do I have to ask upstream maintainers to revert the culprit?

I sent two reverts [1], and probably forgot to add a tag to reference 
this discussion.

Luiz asked me two provide more logs. Hopefully, I am going to come 
around to that today, but maybe it’s better to revert so that Linux 5.16 
can also be fixed.


Kind regards,

Paul


[1]: 
https://lore.kernel.org/linux-bluetooth/20220208221911.57058-1-pmenzel@molgen.mpg.de/T/
