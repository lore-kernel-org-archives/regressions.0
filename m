Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F48657
	for <regressions@lists.linux.dev>; Thu,  8 Dec 2022 07:03:20 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p3Aw4-0001g8-TQ; Thu, 08 Dec 2022 08:03:12 +0100
Message-ID: <abf9b7a0-8de4-76e9-bbbf-4630932949e9@leemhuis.info>
Date: Thu, 8 Dec 2022 08:03:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [Regression] Logitech BT mouse unusable after commit 532223c8ac57
 (still in 6.1-rc8) #forregzbot
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <2262737.ElGaqSPkdT@kreacher>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <2262737.ElGaqSPkdT@kreacher>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1670483000;6bc3d1da;
X-HE-SMSGID: 1p3Aw4-0001g8-TQ

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 06.12.22 15:58, Rafael J. Wysocki wrote:
> 
> Commit 532223c8ac57 ("HID: logitech-hidpp: Enable HID++ for all the Logitech
> Bluetooth devices") caused my Logitech Bluetooth mouse to become unusable.
> [...]

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 532223c8ac57
#regzbot title hid: Logitech BT mouse unusable
#regzbot monitor:
https://lore.kernel.org/all/20221207142433.1158329-1-benjamin.tissoires@redhat.com/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
