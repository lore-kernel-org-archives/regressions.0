Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083CA4AC16D
	for <regressions@lists.linux.dev>; Wed,  7 Oct 2026 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381852; cv=pass; b=hab+LDNF0Bndf6gs/BjkO2pkJMO79Xrn52Uw+hFF+b92wb6nLHpsJmc+jqyCRHMLfbe1ctJoOG0iHgklTMqatRp7v1RNYpzivJ6wO2GJMMCehVs09TPlQgw4GaZvbss2m+SbYA42nt4kn1E+Q8OYTotKaAg7YOc1tGmyEmxPwlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381852; c=relaxed/simple;
	bh=WSTXJWJsccwE3DOevttIxWtqRZIpylg3FDM0jvpjHdY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=U0xqv8tQsDluAncp/JNwtMfWZxfHT75MLzpLeCA4R/sIcRXGcoWu20qpz/vQ2Mw2fOIS+jM2ESEIdgC9rUsnnBA674TYVI2H0ag5uWQ8t4pwqbG6W0txXzn3bErQFOBHnVPj2Ljn2rjGpNEwUiQOQRb/A/FGXE8WhZYChNwzZWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=syncnow.net; spf=pass smtp.mailfrom=syncnow.net; dkim=pass (1024-bit key) header.d=syncnow.net header.i=@syncnow.net header.b=Tx7nAItH; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=syncnow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syncnow.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=syncnow.net header.i=@syncnow.net header.b="Tx7nAItH"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-30b6dad2382so4164759eec.0
        for <regressions@lists.linux.dev>; Wed, 07 Oct 2026 07:04:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791381844; cv=none;
        d=google.com; s=arc-20260327;
        b=dICDeIiJ65ocdpQsqvQeK/tZnhtT5spdRE4iA3IPS7FK/CLf2EvkAvnliPMj3vSzxr
         GpsKp3x3bwEufqyzgEykZPPMh0SdjZQCpQIgVzBzuk/lKQKmuSoB068gTiIgbx0fdTH3
         OYQzhmJG8P4KrG7t98iq3T8QNjPymZDrO/mHtHd6uA5gAQugRJvxZCvhByBqY5XYnCSt
         Q0ePb3OB2ymeuQVUGENXFyrfvotCN3W+awulvckbI53f/A4Y6JpeqjekSWDNZ5OuPOlO
         yRHGPkdeeUprzaXDBeNyrbimRF2gWeqHmuW7/gxOOCGJPSfAgannu6EQHeVaw72CKL7W
         iw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=UnBOAEW74UYhKxlvKCCeJRZujwBr1zgnkVj5Sw1+Xzk=;
        fh=TkSZOE9M+t6hdTfsdls4XdeXhBvtNbOAWVF5ev8EnFM=;
        b=IKe1HXaGCpmnclVU3qAkmCf4rxm0PwBhsevkCS5GxAm5SG2sjlgO2OCTHheV4rs0Cs
         pLp72uExlxAuL2UOLvjEP9VNhloPICCH0jaTiKSDKgMM698Gb9BPZa+n4yH8N0u4qmU7
         tt+4Bu4E6hjY4Z76ofz5P13MTl9WH+uICHlkyecUdTJQwOSTgeApxzuILtc9XCb1Ft8W
         V2R0DiQNfoGYBL8DiUeOmYLupLiiettzo3W7irMZZrv5adejMBakdOEXhiIesXa+1jTv
         kmyG1imiq7/6XHPQDxpzOBa5lrUTe2mMhZL5hJlXDD1M4F+1JuFtdD3Ttrqe5SwK0asS
         lOOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=syncnow.net; s=syncnow.net; t=1791381844; x=1791986644; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UnBOAEW74UYhKxlvKCCeJRZujwBr1zgnkVj5Sw1+Xzk=;
        b=Tx7nAItHqNRLO/3j2l2f9gq/keyIaeeP9KIfBe/HXXscOXh4TrckApQmtyMzH5g6n3
         Mz9LUoPfOlFy85s9lfwp1kiuR6aG3hMi5lVS92faA5eCVEOzNkg7/xRNOpHOMyyY0nbk
         3fURXKKgp1lIpSekDbKUSpGmM/5sHbU87yU5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791381844; x=1791986644;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UnBOAEW74UYhKxlvKCCeJRZujwBr1zgnkVj5Sw1+Xzk=;
        b=Mr0j3gLk4ut6yP5Y7t18HtY+kZvkWl6EVso9NDOacItAydkWT/vphxHFJTwHZd5jPY
         JOhakczmhD+MKw6hM/MCYk8c2icjkm/MtED9HmRM1FNTCfZO0CEFyiMUd0+zEQFQpL+O
         0W7JZX/LWHGYHPr7Pgf/g1UMCwCcxxtUtndHPbn98c8Azmu/FUhr8gkAkanqOGXalG8G
         6/YjIHcJetJKzi94o8Q7kNhmG93SRoFfncp/Pg1VR/4dydtu+lkszNZs7+t3ekdpWj7+
         Ihq1SeB9SmroYE58K/JLrYp2iHm4AJezYb0zb7/WtuEWnLDVn4VSUXPBRpCrq568q1MG
         ppgw==
X-Forwarded-Encrypted: i=1; AKwUvBx4RPgFS79rKb0AAcYHWtj6X0GOJhRMYyK4KuVAFcXOyGpKPl9p8XHaYKKvChplmcO5ClKaJ2v+PLC5AQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ9Ua39N3VQcel9PUJW3TgQEu3G9r/ML41b3GgR/13c8pA82+om
	DLon7KObRPPZnjpYlG5ejjmkKq6HfjbOiWH4TfVR8LeCTxvAQk6tKZVO3C4BBrznOXY3a0bAfRp
	Zq2dDRi8dFDHevefD0HKZG2Pcv9oRjNjzNjoCTU35sw==
X-Gm-Gg: AYBFou2R4LhI/m5EZk1aDZAOd2lquNjpuK2pA5hu3MttwFhZVXQwuTzZELca99Be8hW
	YX2dZ8ptolSyXIUXqorUc8GEN4OVg9zRiHpmSIuInY7N5ga2brCVZf7YfbaKMWLvIiyBRUQY4I4
	oxRgpMnV8ytmj3Uhuy4yEteVnCyXkmrz8g0Ce5je2KlibmgnrOV9SPyihP0xcsipdDGiCfzkOaC
	PdtVlFuu99jgHcdKcVj+hTwayJ1NHjKlJ62nMD4epOVdvSn6EcukBQnpIMSu+Bq8+5txToIvOAr
	UFRA6BtZZOinGQf3ejJbLtySYDLdxFSj7+YNvV3MplAbnS7ciukrpe3vruJWgAfJO4q4YKFwGGU
	vDfCdlOxcng==
X-Received: by 2002:a05:7301:7d10:b0:351:1567:41b7 with SMTP id
 5a478bee46e88-3515de27067mr2546675eec.29.1791381843329; Wed, 07 Oct 2026
 07:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "SyncNOW.net - Armando Araujo Filho" <armando.araujo@syncnow.net>
Date: Wed, 7 Oct 2026 11:03:26 -0300
X-Gm-Features: AclHuK8-af_saXV7TA-LG8aXCH3DnogGPa18MEoCv0DNrdN9_7ez1NZBzDsFSEc
Message-ID: <CACKGD6t4Bz1M_-9cNJ8vuNAYnXg5abb_UxmDAoFpW36yP4DnhQ@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: Skip Target Speed quirk on clamped ports with no link
To: andiwild@gmail.com
Cc: bhelgaas@google.com, blaaaat@hotmail.com, edwardmalik95@icloud.com, 
	helgaas@kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	macro@orcam.me.uk, regressions@leemhuis.info, regressions@lists.linux.dev, 
	restafvalendergelijke@outlook.com
Content-Type: text/plain; charset="UTF-8"

Hi Maciej, Bjorn, all,

Another active-link case for 72780f796468 ("PCI: Always lift 2.5GT/s
restriction in PCIe failed link retraining"). It answers two open
questions in this thread:

  - Maciej asked for HASD results. On this port HASD is clear
    (SpeedDis-), so the HASD check Andreas proposed would not help here.
  - This case never reaches the error path (no "retraining failed"),
    so falling back to 2.5GT/s on failure, as Thomas suggested, would
    not help either.

On a Huawei server the onboard BMC VGA controller, a Gen1-only
endpoint, sits behind a firmware-clamped PCH root port. After the quirk
lifts the clamp, the endpoint is missing from the bus scan, even though
the quirk reports no error and the link is up at 2.5GT/s afterwards.
A rescan finds the device again. Reproduced on Arch Linux 7.2.7. The
Proxmox bisection gives the same 7.0.14-6 -> 7.0.14-7 boundary that
Aoxtj and Mich found.

A note on how this report was produced: I am a network/infrastructure
engineer, not a kernel developer. I noticed the problem (loss of video
on a Proxmox upgrade), ran all the tests on the hardware, and collected
the logs, register dumps and kernel bisection below. The analysis was
done with an AI assistant (Anthropic's Claude): it compared the dmesg
and lspci output between kernels, identified the link-speed quirk and
the relevant commit, suggested the setpci recovery test, and drafted
this report. All data below was captured on the machine and I have
checked it against the raw logs. The interpretation in the "our guess"
paragraph and the suggestions at the end should be read as
hypotheses, not as kernel expertise on my part.

Kernels tested
--------------

Same hardware and configuration throughout:

  Good  Proxmox VE 7.0.2-6, 7.0.12-1, 7.0.14-1, 7.0.14-6
        (7.0.14-6 = Ubuntu-7.0.0-28.28i2, stable 6.18.38 / 7.1.3)
  Bad   Proxmox VE 7.0.14-7, 7.0.14-8
        (7.0.14-7 = Ubuntu-7.0.0-28.28i3, stable 6.18.39 / 7.1.4)
  Bad   Arch Linux 7.2.7-arch1-1 (official 2026.10.01 live ISO)

Hardware
--------

  DMI: Huawei Technologies Co., Ltd. Tecal RH2285 V2-12L/BC11SRSC1,
       BIOS RMISV055 02/02/2013
  CPU: 2x Xeon E5 v2 (Ivy Bridge-EP), PCH C600/X79

  Affected path:
    00:1c.3  Root Port 4  [8086:1d16] (rev b6)  LnkCap 5GT/s x1
             SltCap HotPlug- Surprise- (not hot-plug capable)
      03:00.0  XGI Z11/Z11M VGA [18ca:0027]
               Subsystem Huawei [19e5:2013]     LnkCap 2.5GT/s x1
               (PCIe v1 endpoint, Gen1-only; the BMC's video device)

Register state, good vs. bad
----------------------------

  00:1c.3 (root port)     good (7.0.14-6)     bad (7.0.14-7, 7.2.7)
  LnkCap                  5GT/s x1            5GT/s x1
  LnkCtl2 Target Speed    2.5GT/s (firmware)  5GT/s (lifted)
  LnkCtl2 HASD            SpeedDis-           SpeedDis-
  LnkSta                  2.5GT/s x1          2.5GT/s x1
  03:00.0 enumerated      yes                 NO

The link is up (x1) after the quirk too. It just comes back at
2.5GT/s, the most the endpoint supports.

dmesg, Arch Linux 7.2.7-arch1-1
-------------------------------

  Linux version 7.2.7-arch1-1 (linux@archlinux) ... #1 SMP
PREEMPT_DYNAMIC Mon, 21 Sep 2026
  ...
  [    1.019207] pci 0000:00:1c.0: removing 2.5GT/s downstream link
speed restriction
  [    2.019409] pci 0000:00:1c.0: retraining failed
  [    3.019695] pci 0000:00:1c.2: removing 2.5GT/s downstream link
speed restriction
  [    4.020409] pci 0000:00:1c.2: retraining failed
  [    5.021634] pci 0000:00:1c.3: [8086:1d16] type 01 class 0x060400
PCIe Root Port
  [    5.021666] pci 0000:00:1c.3: PCI bridge to [bus 03]
  [    5.021673] pci 0000:00:1c.3:   bridge window [io  0x3000-0x3fff]
  [    5.021678] pci 0000:00:1c.3:   bridge window [mem 0x94b00000-0x94bfffff]
  [    5.021690] pci 0000:00:1c.3:   bridge window [mem
0x90000000-0x93ffffff 64bit pref]
  [    5.021718] pci 0000:00:1c.3: removing 2.5GT/s downstream link
speed restriction
  [    5.021770] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
  ...
  [    5.045412] pci 0000:00:1c.3: PCI bridge to [bus 03]
  [    5.076827] vgaarb: loaded                       <- no VGA device

00:1c.0 and 00:1c.2 are empty ports, the case v3 covers.

On the good kernels the same scan finds the endpoint right away:

  pci 0000:03:00.0: [18ca:0027] type 00 class 0x030000 PCIe Endpoint
  pci 0000:03:00.0: BAR 0 [mem 0x90000000-0x93ffffff pref]
  pci 0000:03:00.0: Video device with shadowed ROM at [mem
0x000c0000-0x000dffff]
  pci 0000:03:00.0: vgaarb: setting as boot VGA device

How this differs from the other active-link reports
---------------------------------------------------

In Aoxtj's, Mich's and Thomas's cases the retrain fails, the error
path runs, and the link is left down (x0 / DLLLA=0). Here:

  - there is no "retraining failed" message; the quirk returns about
    50 us after "removing 2.5GT/s ...";
  - the link is up afterwards (2.5GT/s x1);
  - the endpoint is healthy and comes back with a rescan (below).

So the device is only missing because bus 03 is scanned too early.

Our guess, not verified: the retrain takes the link down and back up
(the endpoint cannot do 5GT/s and falls back to 2.5GT/s). The wait in
the quirk may see DLLLA still set from before the link went down and
return at once. The bus below is then scanned while the link is still
retraining, and nothing answers. That would fit the 50 us return and
the missing error message. A one-line pci_info() of LNKSTA right after
pcie_set_target_speed() would show whether this is right. I can run
that, or Andreas's earlier diagnostic, if useful.

Recovery at runtime
-------------------

Restoring the firmware clamp, retraining and rescanning brings the
device back:

  # setpci -s 00:1c.3 CAP_EXP+0x30.w=0001:000f   # LnkCtl2 TLS = 2.5GT/s
  # setpci -s 00:1c.3 CAP_EXP+0x10.w=0020:0020   # LnkCtl Retrain Link
  # sleep 1
  # echo 1 > /sys/bus/pci/rescan

  pci 0000:03:00.0: [18ca:0027] type 00 class 0x030000 PCIe Endpoint
  pci 0000:03:00.0: vgaarb: VGA device added:
decodes=io+mem,owns=none,locks=none
  pcieport 0000:00:1c.3: ASPM: current common clock configuration is
inconsistent, reconfiguring
  pci 0000:03:00.0: BAR 0 [mem 0x90000000-0x93ffffff pref]: assigned
  pci 0000:03:00.0: BAR 1 [mem 0x94200000-0x9423ffff]: assigned
  pci 0000:03:00.0: BAR 2 [io  0x3000-0x307f]: assigned

By then the boot VGA console is already lost, so this only shows that
the device is still there.

Observations
------------

1. HASD is clear on this port, so a HASD-based check would not catch
   this case.

2. The failure is not in the error path, so a 2.5GT/s fallback on
   failure would not help either.

3. The retrain gains nothing here: the endpoint only supports 2.5GT/s
   and the link comes back at that speed. I realise the endpoint is
   not enumerated yet when the quirk runs on the port, so knowing its
   speed in advance may not be simple.

4. If an active link is retrained, waiting for it to actually go down
   and come back (or for the device to become ready) before the bus
   below is scanned might prevent the device going missing.

5. Like Mich's Dell and HP machines, this is an older Intel server
   platform where firmware clamps the ports on purpose. A command-line
   opt-out would give users of such machines a workaround other than
   staying on an older kernel.

I can test patches on this machine with a mainline or live kernel and
can provide full dmesg and lspci -vvv from good and bad kernels.

Thanks,
Armando Araujo Filho
