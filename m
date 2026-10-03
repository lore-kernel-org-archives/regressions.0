Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F94D390C9A
	for <regressions@lists.linux.dev>; Sat,  3 Oct 2026 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018422; cv=pass; b=GHtm8RBK5ihfOhugsIX2Wt9ogjHVKLllIMBfRhGA/5IgNpVbZmuR9+AEP0JnLNHlMDljm2nvW1LLcRY2A5dEGGBYmc/b0k6bc5C3xp+zZxCowccDEd7jMaUI69EGLu2hDA60aPCHogz7X7UqVOG5lPM5FAqU+P2cxAiTM7KpiBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018422; c=relaxed/simple;
	bh=HpqvNikVLDJ70kjb8gJjkVOTZdeTnHoE1zMdMiokrPo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=f9jUkBzv5A0U6ylupmOJBTNVKGzjU+5ug3NDqXK2uMbArTypKEsyMsDj8v6YFfyF8yDxA1TFZypYUiP735BMrQA/+JBrqj/j12q3aCFl3Vqd6kcmoA6Szfx0F1WoCGHo2HTyaDUdNYmww9vA2wuTNViyIQNxoECExlCsUWW1Hl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rOOZm/dE; arc=pass smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOOZm/dE"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-145ab8fd39cso130783c88.2
        for <regressions@lists.linux.dev>; Sat, 03 Oct 2026 02:07:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791018420; cv=none;
        d=google.com; s=arc-20260327;
        b=s5U8IAYWFduNGdX7iTyOr4vC1OOl0vxVc4XJigS9cL4hOOLHbhUfQtr0BCiyOdODbb
         ND0fFP4+YdxNfk3he5uRc9n690msVt73/y/7L/NlzJzyZyA6mdZ8sOyG2eGIoVWv/NkP
         jpFGkCb13hPt6R5ySjxpS/sglMHbrqY6/ii03jd8j/fhHzCkQCUFdlp/lz4rATDHKkBj
         RMpSM8BuZkdNEzCUwH70BapPThl8hVCUqWpSZHoPSvUX+6VAq/n0GVoWU5MfrawIZH9N
         yo0618GxP40Cn4ErxhmYlfSE15imK2/nmJTeEdURnEHdlG9uCZPCy59x2hnkMl28Ab9E
         EcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=HpqvNikVLDJ70kjb8gJjkVOTZdeTnHoE1zMdMiokrPo=;
        fh=8J8xtrD/g1B17NaldMsKFsrFkS4N7HhFJ2Yd5j1rS0g=;
        b=dSe8J7Wo7HqQmLdaCOrd8LDsIUu33iCXEoYcYrJjwIzyKYF/UwMFqrxC4c3XMoek82
         uBpiTZQ9pvtNEpS/HWr/Zc42jHNMLNLg4TNJPKciKNdU+6FHZ5frjkRJ2Okty4paJghV
         5Xl3Hpj2EiItbqRyCWvJcUzjkwcrEyCVY/bFNkvSD5rVIPF5i6vrq3VtUNp/iJCiUBBx
         y43imF+PQZDdDOxw0ihF26XVGFGDZFhq5zTi/zfinDP0QZKSJgeztHHd3uJD6Lybd+R0
         3NDpQuXbJTpeEsdJZ1xEMgsyn6HXCZwt/zVqysSPlpxNLKWV2oM/QLntzqRZZDMFbMIV
         mh2g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791018420; x=1791623220; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HpqvNikVLDJ70kjb8gJjkVOTZdeTnHoE1zMdMiokrPo=;
        b=rOOZm/dEx60BYUZerpH4dpuhBWl0yh5PKS28aVHDz1EnUy2n0b+uD3grViQkkj7nDh
         vhnNjTocMiCzNAyi2NxnQdTZKgrkAp8tTw9i0th1slE1jsrUVUOQSBrAGxn5wDydQ9JZ
         1hBNCjHUWrFkurqqsifVVkaDMjdJBAA4XlgQPZ7qy4ea1rkJjZuJJ4AiIQ6UoEHMzJsK
         fTrUGZjtJn4yWJFYa792OVacVDB71/IpHwbZn+dbFft0CXb4whDjB4jJJvHXpze3fFY5
         fyIlyL7DoPjS3yw+6KrllFL9i1vXl/7DzIE6MunTes+1K5VXVMI5lGqHl3WSLepTgG0r
         Lesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018420; x=1791623220;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HpqvNikVLDJ70kjb8gJjkVOTZdeTnHoE1zMdMiokrPo=;
        b=14weTpju5ic4roGT5tPTI7VEe+A4PzVKDxj3jZ3JQz+LnN8mpdTDFreyTfDlve66bb
         vg2YI03PR2Db2Zc+FWVZkvrgNbIudUkTwsohjq8N4Wl/izTa6NhLhMYTf/p3fmvEuhDe
         /zsxGLt5dkqpNydsR5nDexZGxm1Ny4fq0hlQmCQoFz+3ilh/1nbTeRzOvJXfE3iBq52j
         sUvKvJI9WXO2rxOVhzkvTUGkAHxxMH7GfJiebbIQ6QCjRLvWdMoBrXHKYXKnuwQzrTPi
         ifeZxvc8WP1v7xyEJd00CVT++rZF1PI1EkNkCHp52h2iRdyepnJsPjCQNh5w+7CEkjbV
         obeA==
X-Forwarded-Encrypted: i=1; AKwUvBxc25iKIMsODJejkYz7+7WbesGgd8NXyXpsW8PVoE5TJItWg8Pi9eZBltTqHdY4baM3eGMPqEQqVfe4Ew==@lists.linux.dev
X-Gm-Message-State: AFuF++loStABK8HcL3HFDhIaDkxYiC+H10uJSdUw1J2gLRsoJBoaEw2+
	NODUjseRKKrZiPSbGGeWSyJ25BAERKFVZUJ98c3fbC9qvDMJFEfvIXzrPckvIybCyCizBrz/Syj
	lSKrqOsGgitXrqywnVYGWOILTYUM7zyE=
X-Gm-Gg: AYBFou38462gWs6cImPe/AuwWrwP+lwaTqApDThRCb1cCm6XrunchKLhCoHsptvUUM3
	uuyplYYjCy4RrdNF7QASjnL3fla1+DeMmatFr03LP3Vrp0p5BpkwHYK3kIhRQO825Ug5/HO8iee
	xdoJo9hjzOcOyxq1PGnQz0B91XjJ/MgpGkeccQ494OAq/vG2fNALez4qwPC2vACh6tXCqK7F8hd
	PPrrqUcJVYBG/ntoE3n5Iz3XYlylCZxhUi3a6OTHrE2VIVRO2AvnFGrUJckspMwY6v7qq/IsAci
	KBFsD6a9sR5foJ8F4kyuXBx4SjheU4BxR9jnypPu9bdNSBOjHnh2
X-Received: by 2002:a05:7023:889:b0:144:c112:5f24 with SMTP id
 a92af1059eb24-14f5c6e4b77mr6420591c88.25.1791018420013; Sat, 03 Oct 2026
 02:07:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Fran=C3=A7ois_Roux?= <franzelfranzel@gmail.com>
Date: Sat, 3 Oct 2026 11:06:48 +0200
X-Gm-Features: AclHuK-D1pWutY4-GyV2il5anLEEUn-RjWwNXeCIaa0lBTwPNQQBpHP4LHwav_Q
Message-ID: <CAPjyS8dY0Q_o3XmFjuKZZsjhzhoSNL+ZGJtw5cQt8HiV3sUtxA@mail.gmail.com>
Subject: [REGRESSION] PCI/pwrctrl: WCN7850 not enumerated on X1E80100 (Surface
 Pro 11) since b921aa3f8dec
To: mani@kernel.org, brgl@kernel.org, bhelgaas@google.com
Cc: krishna.chundru@oss.qualcomm.com, linux-pci@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Since b921aa3f8dec ("PCI/pwrctrl: Switch to pwrctrl create, power
on/off, destroy APIs") the on-board WCN7850 Wi-Fi of the Microsoft
Surface Pro 11 (X1E80100, board "denali") is no longer enumerated.
v6.17 works. v7.0, v7.1 and linux-next up to next-20260929 do not.

#regzbot introduced: b921aa3f8dec
#regzbot title: PCI/pwrctrl: WCN7850 on PERST#-less qcom port not
enumerated after pwrctrl rework

Hardware
--------
The WCN7850 (pci17cb:1107, ath12k) sits behind pcie4 (1c08000,
qcom,pcie-x1e80100, gen3x2). It is powered through qcom,wcn7850-pmu
and pci-pwrctrl-pwrseq. This port has no PERST# GPIO, so the only way
to reset the chip is its wlan-enable line.

Symptom
-------
qcom-pcie 1c08000.pcie: Device found, but not active

On some builds there is no message at all. The Root Port 0004:00:00.0
enumerates, the endpoint 0004:01:00.0 never does, and ath12k never
probes. Bluetooth on the same chip (UART) fails too:

Bluetooth: hci0: QCA Failed to send TLV segment (-110)

Bisection
---------
git bisect start v7.1 v6.17 -- drivers/pci drivers/phy/qualcomm \
drivers/power/sequencing drivers/clk/qcom drivers/interconnect/qcom \
drivers/regulator drivers/soc/qcom drivers/pmdomain/qcom drivers/of \
drivers/base/power drivers/pinctrl/qcom drivers/iommu \
drivers/irqchip drivers/firmware/qcom

The same .config, the same DTB and the same command line were used at
every step. Each step was judged by whether 0004:01:00.0 exists after
boot.

good 4c4132489201 PCI/pwrctrl: Add APIs to create, destroy pwrctrl devices
good b35cf3b6aa1e PCI/pwrctrl: Add APIs to power on/off pwrctrl devices (*)
bad b921aa3f8dec PCI/pwrctrl: Switch to pwrctrl create, power on/off,
destroy APIs

(*) Not booted: it only adds functions that have no caller before
b921aa3f8dec.

What the boot logs show
-----------------------
Before b921aa3f8dec, pcie-qcom (built-in) probes at ~1.8 s, before the
pci_pwrctrl_pwrseq module is loaded. The WCN7850 is still powered from
UEFI (wlan-enable high), so the link trains at once and 0004:01:00.0
appears on the first bus scan.

After b921aa3f8dec, qcom_pcie_host_init() calls
pci_pwrctrl_power_on_devices(). That returns -EPROBE_DEFER until the
pwrctrl driver is bound. The host goes through ~11 aborted init
attempts, each one powering the PHY and controller down again. It then
succeeds at ~2.3 s, but the link never comes up.

pwrseq-qcom-wcn requests wlan-enable with GPIOD_ASIS (see the FIXME in
pwrseq_qcom_wcn_probe()). The later "power on" therefore sets a GPIO
that is already high, and the chip is never actually reset. With no
PERST# on this port, nothing else resets it either.

Tested fix
----------
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
ctx->wlan_gpio = devm_gpiod_get_optional(dev, "wlan-enable",
- GPIOD_ASIS);
+ GPIOD_OUT_LOW);

The chip is switched off when the sequencer probes, then switched on by
pwrctrl in qcom_pcie_host_init() right before LTSSM is enabled.

The FIXME's rationale (toggling wlan-enable would drop a link that the
controller cannot recover) held while the link was trained before the
sequencer probed. After b921aa3f8dec, pwrctrl cannot bind before
pwrseq-qcom-wcn, and the host cannot finish init before pwrctrl is
bound, so power-on always comes before link training on this path.

Results:
b921aa3f8dec + fix: 0004:01:00.0 at 2.4 s, ath12k OK, Bluetooth OK
next-20260929 + fix: "PCIe Gen.3 x2 link up" at 3.4 s, ath12k OK,
Bluetooth OK

Questions
---------
1. Is GPIOD_OUT_LOW (dropping the FIXME) acceptable now? Or does some
user of this sequencer still train the link before it probes?

2. More generally, should pci_pwrctrl_power_on_devices() power-cycle
an endpoint that firmware left on? PERST#-less ports have no other
way to get a clean reset.

A patch implementing this (also dropping the FIXME and the code that
kept the firmware state) follows as a reply to this report. I am happy
to test anything on this machine.

Environment: Arch Linux ARM (aarch64). Command line: clk_ignore_unused
pd_ignore_unused fw_devlink=off pcie_aspm=off. CONFIG_PCIE_QCOM=y,
CONFIG_PCI_PWRCTRL=y, CONFIG_PCI_PWRCTRL_PWRSEQ=m,
CONFIG_POWER_SEQUENCING_QCOM_WCN=m. Wi-Fi firmware:
WLAN.HMT.1.1.c7-00108.

The full report and the bisect log are in the reports/ directory of
the GitHub repository franzelverbier/surface-pro-11-linux.

Thanks,
Franz
