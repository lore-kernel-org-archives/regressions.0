Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694651FC0
	for <regressions@lists.linux.dev>; Thu, 21 Apr 2022 16:07:15 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nhZKp-0004EH-PB; Thu, 21 Apr 2022 18:07:11 +0200
Message-ID: <de25abef-c071-9f71-36dd-8f2f0b77dc28@leemhuis.info>
Date: Thu, 21 Apr 2022 18:07:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] gpio: Request interrupts after IRQ is initialized
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: firew4lker <firew4lker@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Natikar@amd.com,
 Richard.Gong@amd.com, stable@vger.kernel.org,
 Greg KH <gregkh@linuxfoundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220414025705.598-1-mario.limonciello@amd.com>
 <20966c6b-9045-9f8b-ba35-bf44091ce380@gmail.com>
 <67df4178-5943-69d8-0d61-f533671a1248@amd.com>
 <CACRpkdbvN0ZJnn+N=Vt2n_aO4CnM=E4qpe_3dmu-c8_Ufp8ZzQ@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CACRpkdbvN0ZJnn+N=Vt2n_aO4CnM=E4qpe_3dmu-c8_Ufp8ZzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1650557235;aceedccc;
X-HE-SMSGID: 1nhZKp-0004EH-PB

On 20.04.22 00:02, Linus Walleij wrote:
> On Mon, Apr 18, 2022 at 6:34 AM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> 
>> Linus Walleij,
>>
>> As this is backported to 5.15.y, 5.16.y, 5.17.y and those all had point
>> releases a bunch of people are hitting it now.  If you choose to adopt
>> this patch instead of revert the broken one, you can add to the commit
>> message too:
>>
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1976
> 
> I am on parental leave kind of, but Bartosz knows what to do,
> in this case, since it is ACPI-related, Andy knows best what
> to do, and I see he also replied.

Bartosz, Andy, what's the status here? It looks like the patch didn't
make any progress in the past few days (or did I miss it?). I'd really
like to see this patch or a revert of 5467801f1fcb ("gpio: Restrict
usage of GPIO chip irq members before initialization") mainlined by rc4,
so Greg (CCed) can fix it in the next round of stable updates, as it
seems quite a few people are affected by the problem.

Reminder: this is one of those issue that we IMHO really should fix
quickly, as explained by a text recently added to the documentation:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/handling-regressions.rst#n131

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

