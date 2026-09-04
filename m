Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A3C35DA41
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 02:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788487760; cv=pass; b=Www+OM2Yyrn3qSTuESIbfbWKvStirin9xwbJFszKWbrPhR5Ps1jRNhYpM/l1cC62PX/5Dl29rfdpSdrRl/7mFHxPzgxIhTuRtKj/Zc1ds9loOc88d22EAgMtFxCql2QoZp9Br7GpJyo22/VOfgG+1wG3ipwv8AyNoXI9zeQtQzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788487760; c=relaxed/simple;
	bh=F2Tl3Oq99eaTRWPWi9BlMv2aQ5wHxHe68M6ng1bSypA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gUdBpoeumOwn5zzXpfjKt1nzGcZGgntlOxspFxfmOogQTktuDmJ8I9SqG4ZwxG2lAY0buOcrA3O5jTtmLpNoFxyv9xaD401ZW4bCDFtwsJ01Y0r9h20ueN1YYow5qQ0PcY845gss4ihB/fSLRnog3qcXeiEDK6YS69NOeoG5SZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=getscale.com.br; spf=none smtp.mailfrom=getscale.com.br; dkim=pass (2048-bit key) header.d=getscale-com-br.20251104.gappssmtp.com header.i=@getscale-com-br.20251104.gappssmtp.com header.b=tcgicdIE; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=getscale.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=getscale.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getscale-com-br.20251104.gappssmtp.com header.i=@getscale-com-br.20251104.gappssmtp.com header.b="tcgicdIE"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-86b03b75fecso9505767b3.0
        for <regressions@lists.linux.dev>; Thu, 03 Sep 2026 19:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788487758; cv=none;
        d=google.com; s=arc-20260327;
        b=ADO38Ed2cykRdO9askcnRQfMYycgsbiU26OMsI8vW++KMxrqi1snNdBlyhl3vp5ZZZ
         GKGxSTBSwdLbNCiycDQDwX1bvwE7SuMA+rhe2nQAchWpHxCnj1wkRGRgFH5pD+te1Idy
         M4pW2PEeKKCcoQMG3j2a0giIeFZh6Ixjzw0IJosDOJ1DKJ13Fj/mwks6qwDOi7K4/+Ba
         B2u00/8Wdf5JHHILKQD5Y8+C/PBncdR524IyGjwW3mhxLhLwEpTRMNUGfavBDaVLFHdu
         FeQgEJFw8cp54x66Evv4f+VU5P9Lqpcm4KphxkkbjBgLjMFCIE9YP2x/kqefyxJ/BPTD
         AeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        fh=8BnSLh2g5t/cEFrZh31WOrRCA6zIioTru82Y9nd/d7Y=;
        b=I2ZmaZxzx7TolIOMeEKoD2CwDKgpHCunIXthQWj14wf1I3hYHnRzD6wlzLNWfF5VHp
         PYKdo7Uw3xjmQ6kObXui2gU+vrsBGC+j/dlS5NbW5XX2x+2MeYSQxv0i2XOuQ21mMiDl
         iBvXuxK1NDJqn+1WRI1OE3lvldCgp04K7g7+NYql14ZYaNYXft1VrdWJDQoa1cU0bnXs
         VozmHq3K82uX+yRUQ2K5b3LESq0palz3LhlPL7wS1xw4kJmoqKsI2DG/NSv5KefGvT5a
         9gHAcG4dMjAAgp0A2uE7Z/bxbeM5Gi8x8Za+3F9FgtgiFODOvGSbkq1C5IL3uoPnDCEY
         jlYw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getscale-com-br.20251104.gappssmtp.com; s=20251104; t=1788487758; x=1789092558; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        b=tcgicdIEoCvUFTqyd4fTiQ+wZCCrIuoAkl735hDuWVcHFeFfak9oD6mekfS0th493x
         CVPaRvlJ1Pi4gJKh/2E6TAhXIGmWOgLZMMGWoEWWF39RZIaLBj8wuSKaygSezKEW/Bgq
         LPaMp0hvyPwrgZFxu01P6J67CY+apGXLr1dOJqKewl1VHi1+U+qEtRDVaml7gA8ERaeT
         38dsGUSh2Xyhi7C3zN5neffgPa8X8JujMgWd2r62GTa7WceB1hvxtVywEi5zTob7j7v/
         pSwji//o1dvzb3mdawzQK3PYywI3IilOf+lE3PoxLhIC5d/OuWaXb4wI+stSoaDwAnYS
         9syQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788487758; x=1789092558;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        b=XPeYDGGM2axLqHCd5f+xXpXCRh+//A+A7UvpceFlW4pGsbGeott2ChIfwMsCNSERJn
         /Iqwt1AdJsbALZHCu1KbggIrw+VmYsWS8vnn5isIilAHuRpdeDAEy6DBNJgTOXPNBrD6
         tThIYqialF8NlDFBIQKmNMfByYlO3IoJu9MloZoayr66VLUHfG6VSRgtGbAFIe7xE2+5
         B3WDIuFlPgzwWzR9dusZJiOq9RUfRMufeiorjGQUyTDRVYYm4VgF78sW9zbQ19inBiEY
         A3iygLr9svlyJ75TCiEVhsINRYW38fEw7qJ38g1rNWLiL9zKNsdEHGQWMpftl58U6VHi
         SeDQ==
X-Forwarded-Encrypted: i=1; AKwUvByGp2sw8a20vpib2ft389ISJ8NBhl/C8RVRG8IwKxb2NJ0tvE9vE5uzW7B3PESLqPBWUX8h3wBpwcwqOQ==@lists.linux.dev
X-Gm-Message-State: AFuF++m5yKWg13evIgEJBdgUlYgpkngfV+bVqhSm0dPM6LwP+EoCCBUh
	wgmBEkrAaUfUfq7QyYaFr/LkHgOlFm8+5z+P4rWa8vgt9jDShDODngLreVTPfRu/YjusiYZK8Xi
	i212UK9cMrK2oBe8tyNaEajTiAKKUBeFR6fZbrvQvkQ==
X-Gm-Gg: AYBFou1386oRn6ECYxLJ059R2Rp7Rv/2YDiYcb3TXg6emZZpul8FHstCWf+NshF5cK0
	li3aJyneVdz8WYVpVxJLStRwabpN7dIHY4wC/o4gdXZPlnnvJbQCP5yd2/6RTx25pFzs3REkgt6
	pcvyrGYSnaNbobWoxE5CvehhpXig6+m3Yq4supCNhlRoGYOP1AGzv7Gy1Wzxtbj6nMMDWv6ikR0
	XTJqQe1ri7Afb5cbV0nFccozu7tZebFzk6YX2qw5E/Sk/oC1eD8woPdywtyCZLRQhxCJesHIBCJ
	2+bYobHOCFwkv/aAi0/36S7M/2SVCn+Y8bfoDJvAIYwVaa3mJUDOc0XspmsMhFIyUOuXgB1EI51
	3QXoD4gobFMq4uyKVLRpKaNmCXZi//FdSXqYQ/4sTK/ujYWL0NZOCOj4C0ArUyvI8mXPfsfXzN0
	Z7YGV642GIxqfi23r4hX92pIvo77hg02Lm/gi+cJytvNn8VDFS8mv8xioUtU7xpl4PBnWMi7GVe
	2aCA+VF2I4uV3OYx6SDl/w1oASI5ypdaLLQbzB6oBRIiQ==
X-Received: by 2002:a05:690c:e3c1:b0:858:1661:a43e with SMTP id
 00721157ae682-8711b9aaa64mr18533427b3.0.1788487757996; Thu, 03 Sep 2026
 19:09:17 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 3 Sep 2026 22:09:16 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 3 Sep 2026 22:07:35 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Mario Stanski Jr <mario@getscale.com.br>
Date: Thu, 3 Sep 2026 22:09:16 -0400
X-Gm-Features: AcwNN1XDaXtQz_DOP5De7wVOsTznIju6-tptNtJhslsZFFcD0SUEyHJNS-iMzqE
Message-ID: <CAJe=AAkCeK=-pVve0Ffw_k0UBp4_AiO5BwQ1d2yG-pVe8B0U4Q@mail.gmail.com>
Subject: [REGRESSION] mt7925e: firmware 20260813113118 causes severe low-RSSI
 5 GHz loss
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	regressions@lists.linux.dev, jb.tsai@mediatek.com, jwboyer@kernel.org, 
	nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a severe low-RSSI 5 GHz regression in the MT7925 Wi-Fi
firmware added by linux-firmware commit 3c11e660d3a8 (MR !1191).

On an MT7925/RZ717 PCIe adapter [14c3:0717], WM build
20260813113118 remains associated at about -70 dBm, but traffic suffers
23-29% packet loss, 1.2-1.8 s average RTT to the gateway, and HTTPS
timeouts. Replacing only the two Wi-Fi blobs with the previous pair and
reloading the same in-tree mt7925e driver loads WM build 20260605184805.
On the same AP/BSSID, machine position, kernel, profile and RSSI, gateway
loss becomes 0% and average RTT becomes 4.237 ms.

Firmware-only A/B results:

                         20260813113118       20260605184805
Gateway packet loss      23-29%               0/20 (0%)
Gateway average RTT      1.2-1.8 s            4.237 ms
Internet packet loss     about 29%            0/10 (0%)
Internet average RTT     about 3.7 s          15.109 ms
Three 1 MB HTTPS probes  2 connect timeouts;  3/3 complete,
                         1 partial timeout    4.18-5.25 MB/s

The partial newer-firmware probe received 293689/1000000 bytes in 8 s
(36702 B/s). After pinning the previous blobs, a longer confirmation at
-70 to -72 dBm returned 50/50 gateway replies (4.236 ms average), 20/20
Internet replies (15.548 ms average), and three further complete 1 MB
downloads at 3.91-4.60 MB/s. A separate acceptance run at -74 dBm also
had 0% gateway loss.

Environment:

  Device:          MediaTek MT7925 / AMD RZ717 Wi-Fi 7 PCIe
  PCI ID:          14c3:0717
  ASIC / HW-SW:    79250000 / 0x8a108a10
  Driver:          in-tree mt7925e
  Kernel:          7.3.0-rc1, x86_64, PREEMPT_DYNAMIC
  Distribution:    Arch-derived (CachyOS)
  NetworkManager:  1.58.1
  wpa_supplicant:  2.12
  Link:            WPA2-PSK, 5805 MHz/channel 161, VHT40, non-MLO
  Regulatory:      BR
  Power saving:    off in both runs
  Module params:   defaults; no experimental ASPM/CLC parameters

Firmware identities and uncompressed SHA-256:

  Regressed WM/Patch: 20260813113118 / 20260813113015a
  WIFI_RAM_CODE_MT7925_1_1.bin:
    23ff53b4bb639b30481e2e06bb1688569ad1ba971b897936db539882abfbd120
  WIFI_MT7925_PATCH_MCU_1_1_hdr.bin:
    8eb46014d2a6b4124472eee7476d995008a6f40b1daffef87eb42f30d98699e1

  Good WM/Patch: 20260605184805 / 20260605184651a
  WIFI_RAM_CODE_MT7925_1_1.bin:
    7e4ed27d1e9fe21cdefda35a22da32137b2473fada350617fb603489af19346a
  WIFI_MT7925_PATCH_MCU_1_1_hdr.bin:
    089dd0252a7eb95feed55950ad0fd9e6f751a07b4cf22273de722b73fa50d49e

The regressed firmware stays associated and no driver timeout/reset/AER
accompanied the failure. RSSI was effectively unchanged across the A/B.
Bluetooth firmware was not reloaded during the test.

The workaround is to pin the two Wi-Fi blobs from linux-firmware commit
bd1c66cfef5fb9cba15f1838a3fd222fb88a832b, then reboot or safely reload
mt7925e. No kernel parameters are required on this system.

References:

  Regression commit / MR:
  https://gitlab.com/kernel-firmware/linux-firmware/-/commit/3c11e660d3a8f8b35e12809b4b721a722b597148
  https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1191

  Previous known-good commit:
  https://gitlab.com/kernel-firmware/linux-firmware/-/commit/bd1c66cfef5fb9cba15f1838a3fd222fb88a832b

  Original submission thread (Message-ID
  <20260818010915.445782-1-jb.tsai@mediatek.com>):
  https://lists.openwall.net/linux-kernel/2026/08/18/60

  Full sanitized report and reproduction commands:
  https://github.com/openwrt/mt76/issues/1128

  Related low-signal report:
  https://bugzilla.kernel.org/show_bug.cgi?id=219429

Could you please confirm whether 20260813113118 is known to regress
low-signal 5 GHz transport, and whether the blobs should be reverted
while a fixed build is prepared? I can provide the recovery-safe A/B
script, full sanitized output, mt76 debugfs state or traces, and can test
a replacement firmware with the same procedure.

Regards,
MJr
