Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698BC329C7C
	for <regressions@lists.linux.dev>; Sun, 17 May 2026 23:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779060331; cv=pass; b=b+kRa3yE5ABJz12wGXI7W6LSi4YYA/70YraGyQWRrq3FvImcD6o2+mjDU+kh6A8tue1xqzPpZ+F0tzMY9FKLNE5oIRC52gW+l2MDzSm43jG5PNa1Do3FntqYyt6t8elLDxpzYhYReIVZ9X1/kngh37o77x9RMM1TfhBL/VPZxl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779060331; c=relaxed/simple;
	bh=oQMlYsX+VgifZz5u10HC4ZEMVQVuCOrZ67vfrQ1RB6s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=vGf0wavEKTtSju+8MWA5cyKD8XL7WnSPQ09LK16Yx+PbX6kPK+HMSUEmxHboK1XJvhgTPFWcerSq9HelJgF+pMEJ1TwBEXH4rBsvb3CPH6ivmZPA1dnsPAkQ28smElAV7Tuo8kmzN564sZKtlY+IIJR6h2UoN+lKJlMeQbTEq00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VhHJ6xy2; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VhHJ6xy2"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so6998885eec.0
        for <regressions@lists.linux.dev>; Sun, 17 May 2026 16:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779060329; cv=none;
        d=google.com; s=arc-20240605;
        b=CGssGa6go+6sex+9Rii4YKKnOGSjVt3v213+BPX7/+mzkcojF1FbdHQdt9Mw5BqPcJ
         2rpMx26V2etFodx7Rpy5+RSGCWZez6zU4qp3SWFLgufZt8Ywan5ktDtC1BVnewDyi/nr
         ADbirglk8gdzpIgBvEd7HqRZFXyAjdTGcZ8Rw3i8NLMWE33RuPpvYNod+a2+pp8mVw1t
         j8QSsbnL/1o67q5fAuSiZVp+7jJZZ2TK7bvnA8nPrSOkYkvjeFT1Utr0u+feSqEux2y0
         B/mqFm28yXzoDDyyeuRKwPeqMhkn2ldpaCevXxvNWbfVYyHVJhnBqqNVASQgZovOhQCI
         5Hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oQMlYsX+VgifZz5u10HC4ZEMVQVuCOrZ67vfrQ1RB6s=;
        fh=2gu0AGAXZb3x2ytS0Z68FyxH07QXZD74Cj1qH22vz2w=;
        b=W9YYOLXBOQzrY2Cx8wQ28lS+SBU8fTmEP979hC+yP0ZZRN/aMjS/123znEoMPFg4Gg
         TZwz9LLS+Z4ElXbzjlqo0Al1lAO363NdTNyBqN4oX3tM0QZufEOIvpgDvjpeloend8ri
         Om3Yh/LTxpP87wQgpSvE+lkKt7Fwjh7YgqDGtr4251ZO6njQx6YeYkOSVmDM3ZGe7Hok
         jyGfnprO5BpIiAgB4aV77Qcg9RU4o2hc0Ud5m0iGdQaq6GyJsAlLQ36skbnpuOzUOOzx
         N00tWPRBgrKt5Cp9zkG4ASABMl1Cs0SSHgDK1FBr5zC5BaA5rbpvAXFT3VwFNGcZ8V0f
         5W3A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779060329; x=1779665129; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oQMlYsX+VgifZz5u10HC4ZEMVQVuCOrZ67vfrQ1RB6s=;
        b=VhHJ6xy2czRV8gFIn14SQAGT2JAI0tzLa/YXejIFmHjV97W2gIMQM3QU1nGvcihGk2
         j4RG/vo4vqKffD0DL/CGX4GvbQcWIlYYLLiAqgjlOWJVT8AbG5wR5xzWfpTKmwltIIev
         XVOLseYObauFfhKQtgDLi3LIj8lxioXqblid9O+QWiQtFKcL499EmN37ZsdcV8WoB7N7
         bhHkC809KM4HSyRQIuSYswHgfBN4oOUNMyBFiE0MuS0fmOzIa3ZLvvvKEl4DjFe6NpLW
         ZfHXhv/Z2TdjPb2kH66AgfLy6IuXmEX0FFs7dP18JlUFhFrZFW4e2UxjGXlfpsuEzo6T
         mvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779060329; x=1779665129;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oQMlYsX+VgifZz5u10HC4ZEMVQVuCOrZ67vfrQ1RB6s=;
        b=BlZfiJ87VJMh/K+21NSvdo8ftk1MjNjj96ZUDx6pHreRRM2rcmIh4yq0NoCP5V/oN3
         5T2xLVWoh6h/icUy6bFdVZYA28MajNDejHmHvfVNgJbwZHEojA2YeCQA2fHTajl9bo7B
         2mVreO80HYY12drqfkirmgNDGiPKVWdf0wYZ1d9z6+TBr/3NzR4LBhXaVFIp3pfEjpRr
         R3agLQkH7R3hNCR760rax27jz4FAH7lL1uVJs/aKzO/G6SK2nd5TF9vvD09cwK4cUPlF
         exSapFnijHYQpazav+nGJd9CRoShYjnR7cvNj0vF+RnephR0fK0CBCjdv8ZUXmDutNmg
         KP4A==
X-Forwarded-Encrypted: i=1; AFNElJ9RWPg8bdewit9jYJcQZ/wZuxYJ9CC6laBQIsCyF0MNV8rMhgD07d/ElDHaK+XLzyfoQtxEYgCt14Y3Bw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyacke4NFzS9lYVp5oEZrjR6jHOuQj3BJaklINkTK1wAdiFmVeZ
	GIx7ZZeqK9Gdlqx0isHhSgadgKaoyR58t8DaoTbnlW8Wesr22WMLUU34K0Q/F6nCFxYr6OMF4HW
	IYkmf8W28MGf4Mv4gGoEyoYF2VingLLw=
X-Gm-Gg: Acq92OHbSMbU4S4fUHFryrcsUyCYbXRoAdpGzkqZ6lbVksBtYH70zlzXHoRCrH6PjsY
	6uPQsSA4DQkfWXhueX4kx9r56wYbvLEPbGU27ZLQpKLZSSWmIZQWt9yLNpzohrDQaW8mj1pISAt
	dw5F7U2Yyh3ISXxSIaWOpXQEl/NixZMHZ9HTzzBm/v8QdrZnkphiCaexXH/H3h5avGXhEZJSbRS
	efzrCo+HZ3chra18Xzv1wn90IlS535wAmXKlFu1laKFT5jDA1hz6SuHtuYvaq2iJL/tozDoNqFE
	V8tvpfTFvoeSqC0ITfASrJqlMhClxUCG/l4WhM2z
X-Received: by 2002:a05:7300:e125:b0:2f5:6d9c:7156 with SMTP id
 5a478bee46e88-303986814f8mr6045988eec.17.1779060329249; Sun, 17 May 2026
 16:25:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Brandon Arnold <brandon.arnold@gmail.com>
Date: Sun, 17 May 2026 16:25:17 -0700
X-Gm-Features: AVHnY4InOi6pS-JhDeB7XWvzVJUHUwJqjaT6X2kyEDvJ9oU5Qy6fDU_IKgrEFzo
Message-ID: <CAM07e=vYJE8khJmbsn75SOYye44o8YV8TZsRyF1mFRuUTMCgUw@mail.gmail.com>
Subject: [REGRESSION] Bluetooth: btmtk: MT7922 "Failed to send wmt func ctrl
 (-22)" after 634a4408c0615c ("validate WMT event SKB length before struct access")
To: linux-bluetooth@vger.kernel.org
Cc: luiz.von.dentz@intel.com, tristan@talencesecurity.com, 
	chris.lu@mediatek.com, linux-mediatek@lists.infradead.org, 
	gregkh@linuxfoundation.org, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: 634a4408c0615c206885e60ea05f489c426f64b6
#regzbot title: MT7922 BT controller never registers (wmt func ctrl
-22) after btmtk WMT SKB-length validation

Hello there.

I wanted to report the below information about a commit that I
confirmed broke my MediaTek MT7922 adapter. The commit is also built
into the main Arch Linux package, so it affected me during a routine
update (see the BBS link in the report below). This adapter is the one
that came with my Framework Laptop 16 system.

Apologies for Claude's verbosity and language but I can confirm I
attended the bisect and revert of the offending diff. Thank you!

Workaround in use: pinned to the Arch Linux pre-7.0.7 kernel.

Thanks,
Brandon Arnold

Commit 634a4408c0615c ("Bluetooth: btmtk: validate WMT event SKB
length before struct access"), backported to 7.0.x stable and shipped
in v7.0.7, breaks Bluetooth on the MediaTek MT7922: the WMT function
control step fails with -EINVAL and the HCI controller never
registers. WiFi on the same chip (mt7921e) is unaffected.

This is NOT a v6.19->v7.0 mainline regression -- mainline v7.0 is
GOOD. The regression is the above commit specifically; it is absent
from v7.0 and v7.0.6 and present in v7.0.7.

Scope / affected versions
-------------------------
- GOOD: mainline v7.0, linux-stable v7.0.6 (commit absent)
- BAD: linux-stable v7.0.7 (commit present)
- Independently reported on Arch (different machine -- Lenovo
IdeaPad, MT7922 USB [0489:e0d8]): BROKEN on linux 7.0.7.arch2-1,
WORKING on 7.0.6.arch1-1, identical symptom.
https://bbs.archlinux.org/viewtopic.php?id=313561

Hardware / firmware (primary reporter)
--------------------------------------
- Framework Laptop 16 (AMD Ryzen AI 300 Series), board FRANMHCP09 A9
- BIOS: INSYDE/Framework 03.04, 2025-11-06
- MT7922, PCI [14c3:0616] subsys [14c3:e616]; BT side USB, driver
btusb/btmtk; WiFi side mt7921e (works)
- linux-firmware 20260410; BT firmware BT_RAM_CODE_MT7922_1_1,
HW/SW Version 0x008a008a, Build Time 20260224103448
- bluez 5.86

Symptom
-------
The firmware download and version handshake still succeed (identical
HW/SW version line before and after), then:

Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
Bluetooth: hci0: Failed to send wmt func ctrl (-22)

No "Device setup in N usecs" follows; BlueZ reports "No default
controller available". hci0 exists in /sys/class/bluetooth and is not
rfkill-blocked. Reproducible deterministically on cold boot,
`modprobe -r btusb; modprobe btusb`, and full USB unbind/rebind. It
fails even with btusb enable_autosuspend=0, so this is distinct from
the known func-ctrl/autosuspend race.

Analysis
--------
634a4408c0615c reworks btmtk_usb_hci_wmt_sync() to validate length
with skb_pull_data() before casting the WMT event:

- wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
+ wmt_evt = skb_pull_data(data->evt_skb, sizeof(*wmt_evt));
+ if (!wmt_evt) { ... err = -EINVAL; goto err_free_skb; }
...
case BTMTK_WMT_FUNC_CTRL:
+ if (!skb_pull_data(data->evt_skb,
+ sizeof(wmt_evt_funcc->status))) {
+ err = -EINVAL; goto err_free_skb;
+ }
wmt_evt_funcc = (struct btmtk_hci_wmt_evt_funcc *)wmt_evt;

For the FUNC_CTRL response from the MT7922, one of these
skb_pull_data() calls returns NULL and the function returns -EINVAL
(surfaced as "Failed to send wmt func ctrl (-22)"). In effect the
length the driver now requires
(sizeof(struct btmtk_hci_wmt_evt) + sizeof(status)) exceeds what this
controller actually sends for FUNC_CTRL, so a valid handshake is now
rejected. The pre-patch code cast and read the same bytes without the
strict length gate and worked on this hardware.

Empirical confirmation (mainline, no distro patches)
----------------------------------------------------
Built faithfully from the running Arch config (only LOCALVERSION
added); no out-of-tree changes.

- mainline v7.0 : GOOD (commit absent)
- linux-stable v7.0.7 : BAD (kernel 7.0.7-bisect; WMT func ctrl -22
count = 1; hci0 device setup never completes; bluetoothctl shows 0
controllers)
- v7.0.7 + revert of
70d37a8b9229 (the 7.0.7
backport of 634a4408c0615c): GOOD (kernel
7.0.7-bisect-00001-ge33bfb5d7480; WMT func ctrl -22 count = 0; hci0
device setup OK; bluetoothctl shows 1 controller)

The reverted tree's drivers/bluetooth/btmtk.c is byte-identical to
v7.0.6 (git diff v7.0.6 -- drivers/bluetooth/btmtk.c is empty), so the
v7.0.7-vs-revert pair isolates exactly this one commit.

Reproduction
------------
1. Boot a kernel >= v7.0.7-equivalent on MT7922 hardware.
2. `bluetoothctl list` -> no controller.
3. `journalctl -k -b | grep 'wmt func ctrl'` -> -22.
4. Revert 634a4408c0615c (or boot v7.0.6) -> controller registers.

A straight revert restores operation and is offered as the candidate
fix; alternatively the length checks should be relaxed to match the
MT7922's actual FUNC_CTRL WMT event length. I can test patches, or
provide full bad/good kernel logs, btmon/hci traces, and the exact
short SKB length on request.
