Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C8825602
	for <regressions@lists.linux.dev>; Tue, 16 Jan 2024 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705438229; cv=none; b=CGj81q0+Va5kcuAYjkTy17+O6yXMb87U7WCm/VlW9n/yaeFzqIR1+iyzfyiilXoRPQynF/WhTfm9vkPjV7C6eJLxx4uBktOyjSMnh/ZL5wmYim0hh3gtuRNHPiNX6ho2SYq+O086yYixrztGpf5i+TDfWJThlfn00VWy9TDBFok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705438229; c=relaxed/simple;
	bh=nG0tvbZeAMvpToBrfiYjUnytBafjXDKbT1OWSnM8wDk=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 From:Date:Message-ID:Subject:To:Cc:Content-Type; b=NOheV/PF/FPIDbkzH9ilBJUBtyBLYH/6WvI7VmJZwDGpAhzm6z9MxYCYNTpDSrdgx7lAeqpur3pIuSw344jpEKDHgGfqd3B8SHCIQ/yuF2B67CRwRrkedjFCB6qdORs3wiotHHKBOLqugZKUnVDU5ie5QIWvFPAGQgl4Tovbs8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgdOXcCc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgdOXcCc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-559ce269be2so199323a12.3
        for <regressions@lists.linux.dev>; Tue, 16 Jan 2024 12:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705438226; x=1706043026; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nG0tvbZeAMvpToBrfiYjUnytBafjXDKbT1OWSnM8wDk=;
        b=LgdOXcCcrfqDcQd/6FxeknOwJXhHXEVVMT7olIdStH83yJNrxhnrvzFCY4dIz0oRBn
         bNVmLeezzyJXC0J93r00Um1hf3NKDfFWylovHswydFTBKXDJpRYwQneVEIMsMB7XzQmA
         Vidb6fOC0vYx6KSOk33TI2r7OmE1+0Ocz/9Pcs7WfSxd895cZQG3TQSTEkR1Cc0zRpW2
         jmzU537kpgECft8/9Ec9DgP7aHLrAY2sdz3Rh1LRrdzaEZKhTIsaAwvsv6savPz1HHqY
         DjgvxKsyENoqQptHoOJFDHVXXRZA8NAE3ntLX3YNegVr/B+sp0qc2B7tuD2FPRblUALJ
         7unw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705438226; x=1706043026;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nG0tvbZeAMvpToBrfiYjUnytBafjXDKbT1OWSnM8wDk=;
        b=IfBjWeLe9Tg5RMyv71GV2diopv14wk/sxU5FpfSKZDZWr8aV5STCrm0IS4H/OzE9KA
         6KDQj0Q6YW+jjQydOGeQjLmnZOgHjEORA4UyyHDGu5gHW/dEegn/Yv1fNMe7Hsnr5IRe
         xIelEZuZMd6+X/yIfVZ3fxpu6qrp1mGGzEDhcZZJi/TzRZCqpJgCKfMUf404BBn3NZ5R
         Sui+SuXAXUdx3X0Wmd89NRxRi3lQca9aURdZvEHBS5C0wGJBKySnz5BH6p4kVE5wvsfR
         l1LGfqY7CncYFv0jUS1yjqQGnl02h9OCDxPkaigIxJALBQHubRk06Dnz3aehA/y9fhR/
         oyBQ==
X-Gm-Message-State: AOJu0YwfYzEKFUzibqKlIYt0iSfLr755OLliBv05U+Bj9/gAdyp/L9zi
	Tx/x4OVuK/PozYudWzEmBb0h+bJJ4yP45ue2glRwtRLfe0k=
X-Google-Smtp-Source: AGHT+IHf9KTGzlro5W5MYDrRgLauo6KPQrzRN+/p9Cob3n7vxnY5Ww+00GGzKJnI2Oab8wsNGgb045+0hkYzm2UQd28=
X-Received: by 2002:a17:906:1106:b0:a2c:179a:f6ce with SMTP id
 h6-20020a170906110600b00a2c179af6cemr3681951eja.96.1705438225532; Tue, 16 Jan
 2024 12:50:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Serge SIMON <serge.simon@gmail.com>
Date: Tue, 16 Jan 2024 21:49:59 +0100
Message-ID: <CAMBK1_QFuLQBp1apHD7=FnJo=RWE532=jMwfo=nkkGFSzJaD-A@mail.gmail.com>
Subject: S/PDIF not detected anymore / regression on recent kernel 6.7 ?
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Dear Kernel maintainers,

I think i'm encountering (for the first time in years !) a regression
with the "6.7.arch3-1" kernel (whereas no issues with
"6.6.10.arch1-1", on which i reverted).

I'm running a (up-to-date, and non-LTS) ARCHLINUX desktop, on a ASUS
B560-I motherboard, with 3 monitors (attached to a 4-HDMI outputs
card), plus an audio S/PDIF optic output at motherboard level.

With the latest kernel, the S/PIDF optic output of the motherboard is
NOT detected anymore (and i haven't been able to see / find anything
in the logs at quick glance, neither journalctl -xe nor dmesg).

Once reverted to 6.6.10, everything is fine again.

For example, in a working situation (6.6.10), i have :

cat /proc/asound/pcm
00-00: ALC1220 Analog : ALC1220 Analog : playback 1 : capture 1
00-01: ALC1220 Digital : ALC1220 Digital : playback 1
00-02: ALC1220 Alt Analog : ALC1220 Alt Analog : capture 1
01-03: HDMI 0 : HDMI 0 : playback 1
01-07: HDMI 1 : HDMI 1 : playback 1
01-08: HDMI 2 : HDMI 2 : playback 1
01-09: HDMI 3 : HDMI 3 : playback 1

Whereas while on the latest 6.7 kernel, i only had the 4 HDMI lines
(linked to a NVIDIA T600 card, with 4 HDMI outputs) and not the three
first ones (attached to the motherboard).

(of course i did several tests with 6.7, reboot, ... without any changes)

Any idea ?

Best regards

--
Serge.
