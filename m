Received: from mta-253-222-181.smtp-out.sparkpostmail.com (mta-253-222-181.smtp-out.sparkpostmail.com [147.253.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB838BF3
	for <regressions@lists.linux.dev>; Wed,  8 Mar 2023 20:10:23 +0000 (UTC)
X-MSFBL: biXhCyw3Qv7PL6vEJEXpX9LJ7qjlcYXIu0+1vq7oClU=|eyJjdXN0b21lcl9pZCI
	6IjE4MTk1IiwidGVuYW50X2lkIjoic3BjZXUiLCJyIjoicmVncmVzc2lvbnNAbGl
	zdHMubGludXguZGV2IiwibWVzc2FnZV9pZCI6IjYzZmZmM2U2MDg2NDhmYTY5YTU
	yIiwic3ViYWNjb3VudF9pZCI6IjAifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jetro.fi;
	s=scph0722; t=1678305011; i=@jetro.fi;
	bh=7fUjpORLA3TtUHjqVMrMy4HdWjQjD0+guTj3+2Rt4VY=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:List-Unsubscribe:
	 From:To:Cc:Subject;
	b=jU/5EfJTx25F57y+rdncKLVHZkz5U6KWpraIsHBfZTvV/Gh521FQySptCC9YsMdxO
	 J/ve/2YpAnfg9ImjTEYEwbjhMX/v3Z8GxddFYnNJ3mRwm1lLWmpzqPZaXsTcp9ueuN
	 CIrUJspAQsg0vyQkFwSGfIkKkEqsDpeAFmaZXQzM=
Authentication-Results:  gc.mta3vsmtp.cc.prd.sparkpost smtp.user=<hidden>; auth=pass (LOGIN)
Received: from [95.216.160.149] ([95.216.160.149:50846] helo=tu.jetro.fi)
	by gc.mta3vsmtp.cc.prd.sparkpost (envelope-from <jje-lxkl@jetro.fi>)
	(ecelerity 4.4.0.18004 r(msys-ecelerity:tags/4.4.0.50)) with ESMTPSA (cipher=AES-256-GCM) 
	id 88/25-28274-3F6E8046; Wed, 08 Mar 2023 19:50:11 +0000
Received: from [2001:470:28:7b9::190] (port=33724 helo=mopti)
	by tu.jetro.fi with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jje-lxkl@jetro.fi>)
	id 1pZzne-00BCor-1f;
	Wed, 08 Mar 2023 21:50:10 +0200
Date: Wed, 8 Mar 2023 21:50:09 +0200
From: Jetro Jormalainen <jje-lxkl@jetro.fi>
To: Meng Tang <tangmeng@uniontech.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, Takashi Iwai
 <tiwai@suse.de>, stable@vger.kernel.org
Subject: [REGRESSION] External mic not working on Lenovo Ideapad U310, ALSA:
 hda/conexant: Add quirk for LENOVO 20149 Notebook model
Message-ID: <20230308215009.4d3e58a6@mopti>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Unsubscribe: <mailto:unsubscribe@eu.sparkpostmail.com?subject=unsubscribe:yOWhMwcquKaPPvewl-NKChrLft05QYZPAlG9ZIEBzRo~|eyAicmNwdF90byI6ICJyZWdyZXNzaW9uc0BsaXN0cy5saW51eC5kZXYiLCAidGVuYW50X2lkIjogInNwY2V1IiwgImN1c3RvbWVyX2lkIjogIjE4MTk1IiwgIm1lc3NhZ2VfaWQiOiAiNjNmZmYzZTYwODY0OGZhNjlhNTIiLCAic3ViYWNjb3VudF9pZCI6ICIwIiB9>
List-Id: <spceu.18195.0.sparkpostmail.com>

External mic on Lenovo Ideapad U310 has not been working with and
after 5.19.2 release. Same problem still exists on 6.3.0-rc1. Reverting
this commit makes external mic to work on 6.3.0-rc1. These were tested
on vanilla kernels.

Bisecting shows that this commit breaks external mic:
f83bb2592482fe94c6eea07a8121763c80f36ce5
ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model

After this commit Pulseaudio only shows "Microphone" port as before
there was "Internal microphone" and "Microphone". However when
recording this "Microphone" port that seems to record internal
microphone. External mic cannot be recorded at all after this commit.

External mic not working (dmesg):

[    7.565222] snd_hda_codec_conexant hdaudioC1D0: CX20590: BIOS auto-probing.
[    7.566141] snd_hda_codec_conexant hdaudioC1D0: autoconfig for CX20590: line_outs=1 (0x1f/0x0/0x0/0x0/0x0) type:speaker
[    7.566152] snd_hda_codec_conexant hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    7.566158] snd_hda_codec_conexant hdaudioC1D0:    hp_outs=1 (0x19/0x0/0x0/0x0/0x0)
[    7.566162] snd_hda_codec_conexant hdaudioC1D0:    mono: mono_out=0x0
[    7.566166] snd_hda_codec_conexant hdaudioC1D0:    inputs:
[    7.566169] snd_hda_codec_conexant hdaudioC1D0:      Mic=0x23
[    7.566172] snd_hda_codec_conexant hdaudioC1D0:    dig-in=0x1a

External mic working (dmesg):

[    8.381160] snd_hda_codec_conexant hdaudioC1D0: CX20590: BIOS auto-probing.
[    8.381691] snd_hda_codec_conexant hdaudioC1D0: autoconfig for CX20590: line_outs=1 (0x1f/0x0/0x0/0x0/0x0) type:speaker
[    8.381700] snd_hda_codec_conexant hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    8.381705] snd_hda_codec_conexant hdaudioC1D0:    hp_outs=1 (0x19/0x0/0x0/0x0/0x0)
[    8.381710] snd_hda_codec_conexant hdaudioC1D0:    mono: mono_out=0x0
[    8.381714] snd_hda_codec_conexant hdaudioC1D0:    inputs:
[    8.381717] snd_hda_codec_conexant hdaudioC1D0:      Internal Mic=0x23
[    8.381721] snd_hda_codec_conexant hdaudioC1D0:      Mic=0x1a


cat /proc/version:
Linux version 6.3.0-rc1-1 (linux@archlinux) (gcc (GCC) 12.2.1 20230201, GNU ld (GNU Binutils) 2.40) #10 SMP PREEMPT_DYNAMIC Wed, 08 Mar 2023 17:45:22 +0000

hostnamectl | grep "Operating System":
Operating System: Arch Linux

uname -mi:
x86_64 unknown

#regzbot introduced: f83bb2592482
