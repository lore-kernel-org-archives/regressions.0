Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CF32B137
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 08:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789462679; cv=pass; b=lQwNYr/Av/mJHGN+SkRvW2q4OGtj+HYZ3ONMbP7Cb8DT4/4fFcfmpZnYdZCipM3HFuWI/UulgmsRXhVoWghrcyOCMalW/CsM+n2T8CqiJwoGsKGhFIu2wi4/8vzxQScSrPJp7NO4mKa6B+ir2FiU5nKWNMz9Pb47x80xsGvwg/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789462679; c=relaxed/simple;
	bh=0ql72QbH7pw4Axa3p8jt03Ns0TkORXMZdX5qHlPe2Lc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=u3sJkxm/kUJ58/opAvkZO6hhuplOULbTiloGDNbnalT9qSRLIh2PxyYcda0ZeiSfkm8VF3CLho82zvkD1l9svGW9C/A2qKo4NfbMtuyFR41P539FDC8CyAuc0PaD2YQxr2Y4g/C9DAIQbjtZdHadAq7041ezziejw0gOGzF7ORY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=afronta.com; spf=pass smtp.mailfrom=afronta.com; dkim=fail (0-bit key) header.d=afronta.com header.i=@afronta.com header.b=WX7pfS5S reason="key not found in DNS"; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=afronta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=afronta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=afronta.com header.i=@afronta.com header.b="WX7pfS5S"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6ebso32110506d6.2
        for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 01:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789462677; cv=none;
        d=google.com; s=arc-20260327;
        b=PJEokPI5fW//lpq5HD/sQimDxT/rY4OInxZyF/Me4zDYiYVisBKaSQ3uWASrdwt0hM
         lS6kwBg0JwOnGlfSLDcIniHEWzI16o/5aWCgHDbyIlB5v+L8U9FWSIQJwE+L2iM2wFu5
         lK0ujDTMISuMQW5+5rEbUk8VDd0XpKLAZFUUu2lACcMsEsV+d6Hp14hlkQ5ACKePbb2p
         7ZMMnl9mErkvqtl40bK1CeqwM/jcKFZmDTQDTWO5SmDYSNXrgMn5fQ1iRpM5VnijMHeS
         SRdpLj3lpy/PitLTqKvktBakIo9NMOc4kRQqmAHz7vhkAzLZHePIz70Flnwmsc5yjTFW
         oYKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=lhidRH+9Pkcz5W8FSzL02l8b5bot/SDbfN4RFTRjNFY=;
        fh=pog0Sivu3WsEr2TTDthwHVWygImSa4K85DEuUQs6tXY=;
        b=pcanloHpipXGXf9Smmy8Doza0z/jSmCkPMr/lnqyU1s4XVW8qBLBw/zghOjEQtT7LW
         lKkiUm91tB9ktwZd5HwpZG2huAWHyMLHogqVNMqZqHCb5NDqDzRHuSxsvcAb8GzoOe42
         4xKEXuZkEMr1u+7lGkv5wa16ZsxO4VP23mB8Al12EPwchi5FOPrMLXxHLUWaf88Vk8k6
         QwxfC6ETWcK2mfwHy0nmcXXNu4987+ZgxFKDc5CqSFqMUy56tsQvCG1Tno9egAF90DYU
         GtFHR1uc6SzV0ZYsEf2X6K694eNLFMi0GltMO66Vi3MZJct0VbucICQuKAjTILV/TYxX
         qAjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=afronta.com; s=google; t=1789462677; x=1790067477; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhidRH+9Pkcz5W8FSzL02l8b5bot/SDbfN4RFTRjNFY=;
        b=WX7pfS5Ss+TUy56H38Mdh+hRYSVA+fhjadZBNMaXDAM31EnJKkkwTGGBQa0KggvykM
         rxgwD7w8txg58x7fxOq/3tnJnBBM4xdWZryntDpxMue4tG4PES7qyBxoPzDvH8j/74My
         otBCZVzYxG0192KdxrHnXzMcJoQoodbtaohcAeCnoQ6cwySnAfLEDdYEAm4AB7v8OFpV
         z2EFxHMNnfINDFK/4tAF6Zceq8ArD6ydksfiTygUEKHOtKFosSkXkKciQzEt16iIs95M
         FSWZ736nniQ6GcM6yHO0s0AV8vgavOHuDl/N7bgMkjUOcaregUfE68kauR1JDZFxhBOM
         tztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462677; x=1790067477;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lhidRH+9Pkcz5W8FSzL02l8b5bot/SDbfN4RFTRjNFY=;
        b=1KW9llVzZJWVLnY4xrakBXH5YT6QXD0EbwOaKyxIwsc1o9zv4GRMfJ/B1dauwlfCNW
         rFdyHnfSC4HIp4Leu4VBW3bHOuBLuaXBOSw1hwWFveSuvNgu+vTe8x+jYf+1sBxa0hxC
         jyechTK9BzLU+cl3Vpv54u/qWwh1JEJVRhlokz/ytvPq+wzrw7iML2EtM098COZ7/qxk
         XnOFQjb8J0cLvQkTw1wekOlxOnRshLONO1RN5+rsVekHzKbtTCh9MYcjrWISWiZB2WVJ
         t3Tc6ILjBW1DVpXoAauhh710WuO4WF5oZyOCcI2gi0NRBIY5P49c2trbjnIrtUSXc8xt
         jMHQ==
X-Forwarded-Encrypted: i=1; AKwUvByg804i4TQV/aFe9KuYUwukvx0oaHqYTDgOinl2OIEdL5iEiKcUvUfR8SSo+nAaZ5A2fVbPuBK7NFQ0pA==@lists.linux.dev
X-Gm-Message-State: AFuF++m346MT4y7rjb75+zWT9GtLs+vyQOQ6qzv157OzrFPyCYvJ+Dwh
	gyGlUJL40WSfPWeP1xuRjQzlGDuiSig0siD4jdx30qvTEcK8k+y6SvHxgPk3qw2V5CL6rZuzW+6
	i1xP6LwcUa9GCR3jDEEVDo67I93l6zjZGv6a5B5Fmsw==
X-Gm-Gg: AYBFou2TecCCoNY4Gto/xRt3pvm74vUGWIm735+VXOO2/2thUqMsbgleAUF1pM1fmch
	IUFJrMthUvMXcB/alxVHtlLIvRn6JaW6TRJPimiiKIB0PIWVCL3kv6DlCPOz5YsFV1n4zwwSXHb
	sRNGqMho32ttgAKw2ycfUce+l0cHlsJwAEqsiGYUV+7EwHI8yc7NWOVLavLA12+gQIp5LU8jIr3
	PgS7tZSjyZBOlya+GzWcE9NuuUpQBnoqw8I0wA4cmCrBakf2o+Hto/9SLslf/o5eQbCaL0JgkgX
	IUipCHNV62undoIy+FZtDWil5yKpUC8rJylHyCcuRg3l5bf1kWbaaj55Nzoz0Flyac5HJfPmQPK
	74ORsbMk9MA==
X-Received: by 2002:a05:622a:15c5:b0:530:f729:d7af with SMTP id
 d75a77b69052e-5310d093675mr86900221cf.54.1789462676763; Tue, 15 Sep 2026
 01:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Javier Herrera <javier.herrera@afronta.com>
Date: Tue, 15 Sep 2026 10:57:45 +0200
X-Gm-Features: AcwNN1Xje16APL8FB5kW-5dTK80nHClMRqtoCTZOipRNVUfKOw5E0o2_Qmwv9rs
Message-ID: <CAKRuCQLWEcci9hPgNUmvq44Bd2H30T5_vP=exMjsknXMN5Yh9A@mail.gmail.com>
Subject: [REGRESSION] e1000e: heavy packet loss on Lenovo ThinkPad P14s Gen 5
 (I219-LM, Meteor Lake) after K1 re-enable; fixed by disable-k1
To: intel-wired-lan@lists.osuosl.org
Cc: dima.ruinskiy@intel.com, vitaly.lifshits@intel.com, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	netdev@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

Since commit 578294b8b60d ("e1000e: Reconfigure PLL clock gate timeout and
re-enable K1 on Meteor Lake") the integrated I219-LM in a Lenovo ThinkPad
P14s Gen 5 (Intel variant, Core Ultra 9 185H) shows constant packet loss
and erratic latency on the wired link. Wi-Fi and a USB-C RTL8152 adapter on
the same cable, switch and router are fine, so the network itself is not
the problem.

Setting the private flag "disable-k1" fixes it immediately, so this looks
like another system where the PLL clock gate reconfiguration is not enough
and the DMI quirk table introduced by that commit should be extended.

System
------
  Laptop:          Lenovo ThinkPad P14s Gen 5 (Intel)
  DMI sys_vendor:  LENOVO
  DMI product_name:    21G2CTO1WW
  DMI product_version: ThinkPad P14s Gen 5
  DMI board_name:  21G2CTO1WW
  BIOS:            R2DET43W (1.28), 2026-06-22
  CPU:             Intel(R) Core(TM) Ultra 9 185H (Meteor Lake)
  NIC:             00:1f.6 Ethernet Connection (18) I219-LM [8086:550a] (rev 20)
  dmesg:           MAC: 16, PHY: 12, PBA No: FFFFFF-0FF
  Kernel:          7.2.3-arch1-3 (Arch Linux)
  e1000e:          version 7.2.3-arch1-3, firmware-version 1.1-4
  Link:            1000 Mbps Full Duplex, Flow Control: Rx/Tx
  Link partner:    consumer GbE switch/router at 192.168.10.1

Reproduction
------------
Plug the cable and ping the default gateway on the LAN. No suspend/resume
involved, machine freshly booted and on AC power. Nothing e1000e-related in
dmesg apart from the link up/down messages; no "Hardware Unit Hang".

Default (K1 enabled):

  $ ping -c 30 192.168.10.1
  --- 192.168.10.1 ping statistics ---
  30 packets transmitted, 18 received, 40% packet loss, time 29734ms
  rtt min/avg/max/mdev = 0.211/0.315/0.384/0.046 ms

The lost packets are spread over the run (seq 6, 8, 9, 11, 13, 14, 16, 19,
20, 24, 25, 30), not a single burst. DHCP on this link also takes 1-2
minutes to get a lease, consistent with incoming packets being dropped.

With K1 disabled at runtime:

  # ethtool --set-priv-flags enp0s31f6 disable-k1 on
  $ ethtool --show-priv-flags enp0s31f6
  Private flags for enp0s31f6:
  s0ix-enabled: on
  disable-k1  : on

  $ ping -c 30 192.168.10.1
  --- 192.168.10.1 ping statistics ---
  30 packets transmitted, 30 received, 0% packet loss, time 29713ms
  rtt min/avg/max/mdev = 0.169/0.251/0.468/0.054 ms

  $ ping -c 30 192.168.10.1
  --- 192.168.10.1 ping statistics ---
  30 packets transmitted, 30 received, 0% packet loss, time 29677ms
  rtt min/avg/max/mdev = 0.101/0.222/0.360/0.064 ms

The result is stable across repeated runs and survives link down/up. I am
currently working around it with a udev rule that sets the flag on device
add.

Suggested change
----------------
Add the machine to disable_k1_list. Lenovo encodes the model in
DMI_PRODUCT_VERSION (product_name is the per-configuration machine type
21G2CTO1WW), so matching on that is more robust:

{
.ident = "Lenovo ThinkPad P14s Gen 5",
.matches = {
DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad P14s Gen 5"),
},
},

Only the Intel variant (machine types 21G2/21G3) has an I219-LM, so the
match cannot hit the AMD version of the same model.

I am happy to test patches or collect more data (register dumps, ethtool
-S, different link partners) if useful.

#regzbot introduced: 578294b8b60d

Thanks,
Javier Herrera
