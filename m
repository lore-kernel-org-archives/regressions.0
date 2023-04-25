Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8C63C0A
	for <regressions@lists.linux.dev>; Tue, 25 Apr 2023 18:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805DDC433D2;
	Tue, 25 Apr 2023 18:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682446765;
	bh=a5e362dR6ySmw3iQpUCph0QtcBgaA6XNxOfsDsKytJ8=;
	h=Date:From:To:Cc:Subject:From;
	b=hUbarVppEHXayqsLjl4Il6wCkfQW/tj7LIAge1mA22D+CPDvYi9xL0fuAL8c0GZky
	 iX0Uh7x6sV2naYai+MHUlMcALiypzNGTq87og0UNAq7BfGlp6yMgrDr/dRgZojq7Zx
	 +7tGAJMTY1XptODsTAeBLUTyjQsiWeI8RBbTAbbX5uq0iSdNnl6MSCYs5eqD6Z4xZw
	 LNoI3ncfEk86w6aaFgMhYkuqMxgL+fybqVF2rREnco5ALB9JVAduDtP9VOhcnH+NCR
	 9/pNrcNSQHXT4Oi/naqPpgSbdhalLWijaJLmovHrZhTUwKtMDw/SX/rx4C5YfUbLrm
	 CaRfNdXdJn5cg==
Date: Tue, 25 Apr 2023 11:19:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, regressions@lists.linux.dev
Subject: USB sound card freezes USB after resume from suspend
Message-ID: <20230425111924.05cf8b13@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi!

For a few weeks now I can't use any USB devices if I suspend my laptop
with my USB sound card active and resuming it without it connected.

USB worker threads seems to be sitting in:

[<0>] snd_pcm_dev_disconnect+0x1e8/0x280 [snd_pcm]
[<0>] snd_device_disconnect_all+0x42/0x80 [snd]
[<0>] snd_card_disconnect+0x128/0x290 [snd]
[<0>] usb_audio_disconnect+0x11a/0x2c0 [snd_usb_audio]
[<0>] usb_unbind_interface+0x8c/0x270
[<0>] device_release_driver_internal+0x1b2/0x230
[<0>] bus_remove_device+0xd8/0x150
[<0>] device_del+0x18b/0x410
[<0>] usb_disable_device+0xc6/0x1e0
[<0>] usb_disconnect+0xda/0x2c0
[<0>] usb_disconnect+0xbf/0x2c0
[<0>] usb_disconnect+0xbf/0x2c0
[<0>] usb_disconnect+0xbf/0x2c0
[<0>] hub_event+0xf01/0x1cd0
[<0>] process_one_work+0x1c4/0x3d0
[<0>] worker_thread+0x4d/0x380
[<0>] kthread+0xe6/0x110
[<0>] ret_from_fork+0x29/0x50

Which is:

snd_pcm_dev_disconnect (/usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:818 /usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:812 /usr/src/debug/kernel-6.2.12/linux-6.2.12-300.fc38.x86_64/sound/core/pcm.c:1129) snd_pcm

It happens on Fedora 37 and Fedora 38, it seems to have coincided with
the 6.2 kernel but I'm not 100% sure.

The USB devices come back after half an hour or so, silently.
There's nothing of note in dmesg.
