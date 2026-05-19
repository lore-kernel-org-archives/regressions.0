Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD90128395
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 04:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779165117; cv=pass; b=iCnshaJxaum6dwxWOiAnMLj0C4B+u+6dyG0lUKYWmo4CFyzPzDwBlYsJk/0WKkQZDZn3VViUsjw8mMPoHZSoSP3oKEmbAVPnjr/BmjC6yHIhFFekVwjpgEicTcHCRgOYYd7zfV7pJOvAOPGT8hKbWrAo5CJWmKbcQq6rZcqFlXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779165117; c=relaxed/simple;
	bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=t/+uRx+1jpBEM3z7Y7MlaJvvh7a4UGfn87zWO/ou4Cz3+uht1rK+ytiEltjsz6r8L56/L/BMNB//DX3hv1Hgt/nD6iIKpFXYhIY5BybujBxG5pXfl/02YVc2wyMDvKsWZ4ymrFjhc+yXtAJ/hoZP/dst9KKwT+XdW+kfJ7k7Qvk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkDKx8al; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkDKx8al"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45562c41ec7so1753921f8f.1
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 21:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779165114; cv=none;
        d=google.com; s=arc-20240605;
        b=C4kEuSysYMVPoNQvzOm5GkH4lYp52jaJHXtJ/3SVjBf5qsb/8p2btgX6Yf6Azv+hKA
         NybjNXUY2ywylhqCjiBetXctAbgevzqSM174pXuC5vT3h9uiSjKJkGq4oj3s2uior/aa
         r+jxRM/9m0927HZRwqmC+6gQbF7hTNSqY0ifV0GR97/P46bFThy9fcrQO7UhzrFDHGEw
         lgqIytBaKxGSuGppJ4PtZL5VbhsGIk9eheE9m2AUC0R2hkhjTXepDz3XXGXjzv4n04V4
         Hr/9l3E8ki0lyImt63jQvcm3O4hAu8DqEjZAGYbiRzbB1W7W5lv5fJU0DHnsItt+FXq2
         naPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        fh=LfcRV2Q7HrPe7+JkypElTJuGNLc/6/fl0FSpkEsi49M=;
        b=Eoyqw9+H7t2fV7y7dkrFPBsXOD9nC6oiVPrbnKv4thYNgHPElrUPYIVsy7/7urbfQv
         b6zMlvaKQlyary1cZt5LF3+5zFnbnB26Y8YNt24CELqpuuGO7mxPakfRjtthYWjNAbKu
         rMzvp9W1uzQ0GC6UWWwJyRNCUM/eaBAcc2GPTuBqHlElDIbv/ZcvH3lwWKDgjLvXCz3K
         BiaKGuQHzrQ5yy+rYKCecEEG86rlV4tCdMWhmQtVUN/c1LW2Dxcxmgj5glgs3l4PMblb
         ol3T7JscLsJ6vvdcHfvNdkvGrZ5s8oUflKeiYar6kBPDeI3ClejqR5WOPbvE3Bp/4AfA
         WfuA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779165114; x=1779769914; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        b=kkDKx8alivWQ72yw46Hi9eRyZDHgMygucxvl2CmBUARuaxx529Sxg5/L7UcTWJswBi
         qXX4ZE44wVyNUcex0SWqmqmrj2za+JfdeKihICmJN4SWBR6xE3cC0+x0+Nyp8xOx4UL1
         J1fUlfUAEXTNfdSppY2PDLsscKLATeuewIKLwtwyEtjlbXoJOORGn7PdBE+OebCC9d3D
         jqI3GARPag3euoJxzxSBmL6sdqXiTFvEf06gadR3m62N6E429k5GADKEvevhbYL42YZp
         7m7M5HtPHj6OixBdvy/ePY0NGtqK7+GlrjP9bntqnujY4ZdXPAi9khHCwkT/134AxoDz
         kdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779165114; x=1779769914;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LB2eeG1SpolST48Ht8N5ZVmPK5SGJL8UVYCuIxMFohc=;
        b=F5Oe1JY/+Eg/NLya6PgOkxmJMlmwk7kKSp1LH37MIyPx0vZ4+v7oeUYlL0miHieYpV
         SbOoOwcXjKWhqAGPtLnGnNaNgdG6sYWsHsMKerf0LcO6+F3nwH6YXPwkVZAKqCKgY4iu
         zPcEyUl43eh1TqsE0c9QuhdPqbfD2rLRfjRv3jWhuON5Gwd8bTqwlqe/sjISyLw4JVw3
         I+vAcP7Ww/cNrlFELaeoqb9gXsFqGXremWgjq76hfaicDFNeoa4zKacERPd8tK6dtV5E
         jLXewEYFqaBsoC23KNxYdqVrRhCbu/MQd0YrMFiwpL2MNaUdOPqANFlAoPMzcX0+WY4j
         ORig==
X-Forwarded-Encrypted: i=1; AFNElJ8LX3CJIzxHQkHklL5fU7Mi34bOjp+4gbkylvkNL7Zm8itFl/t2zJGMc4m4Ti9KUpDvjtHDvrsIiKPXnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPqm+ulk7i538AAruy60Hfzv+AJd037n3qHhgvIRR3ZA9c9WDs
	JufSx3l2VaEaiXZCGDrq3X2Av3YOtmqjts4h5yGBIVsZgpbhrbcayUDR6oJbd9WZvwDHwOBBNoC
	MXE4RxenGWk4yruAQTfyDkff2zIijm5A=
X-Gm-Gg: Acq92OFc4Ixtuo/SpfmE1MyAQRG+ya6b5euv2IQAXiCL/slZr0XNxRrDhyzDPogks0Y
	LEngcZ1IWeBzAY0Tga4p2Tuh641/urbDHAaY4vGIc/fnuJXQW9qMYpZgpv/YHG5hFrdDDP2Fu3i
	8but/cgXuAw2rh99j1NtXUSNQMNQsw548B5IjNul5hqpzhkq/Q+8BlZgA0gGz0P8BTbum4ies5n
	zG/jorA48fI/IkEsZQmj1GrrEzdIlK7VZ9p/CoDuDTh2tTsYWYkx+58OjIoFVyUq3/MKO3ep8X9
	pEwjsrNxkPmNTuxjCiZR
X-Received: by 2002:a05:600d:10:b0:48f:cfae:b654 with SMTP id
 5b1f17b1804b1-48fe60e5537mr217793815e9.1.1779165113908; Mon, 18 May 2026
 21:31:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Baley Eccles <baleycod@gmail.com>
Date: Tue, 19 May 2026 14:31:42 +1000
X-Gm-Features: AVHnY4Li5nUZrvw8vcm2bYlGMK9IhnqMjGOljLZnXZ-_QnQCztFbvk2LXkdu2tc
Message-ID: <CADCSNFD0Ut-jJohTQFczjBgaVf=mBrc2rq4hJQncVZpF4bCoxw@mail.gmail.com>
Subject: [REGRESSION] Bluetooth: MT7922 fails to initialize after "Bluetooth:
 btmtk: validate WMT event SKB length before struct access"
To: linux-bluetooth@vger.kernel.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Subject: [REGRESSION] Bluetooth: MT7922 fails to initialize after
"Bluetooth: btmtk: validate WMT event SKB length before struct access"

Hi all,

I have experienced and looked into a regression on a MediaTek MT7922
adapter. Bluetooth works on v6.18.29, fails on v6.18.30, and reverting
the bisected commit fixes it.

Hardware:
MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter [14c3:7922]
Subsystem: AzureWave ASUS PCE-AXE59BT [1a3b:5300]

Good kernel:
6.18.29-p2-gentoo-dist
Upstream base: v6.18.29

Bad kernel:
6.18.30-p1-gentoo-dist
Upstream base: v6.18.30

Failure:
bluetoothctl list prints nothing / no default controller is available.

Bad dmesg:
Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
Bluetooth: hci0: Failed to send wmt func ctrl (-22)
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
advertised, but not supported.

Good dmesg:
Bluetooth: hci0: HW/SW Version: 0x008a008a, Build Time: 20260224103448
Bluetooth: hci0: Device setup in 129909 usecs
Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is
advertised, but not supported.
Bluetooth: hci0: AOSP extensions version v1.00
Bluetooth: hci0: AOSP quality report is supported
Bluetooth: MGMT ver 1.23

Firmware:
/lib/firmware/mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
/lib/firmware/mediatek/WIFI_MT7922_patch_mcu_1_1_hdr.bin
/lib/firmware/mediatek/WIFI_RAM_CODE_MT7922_1.bin

Bisect result:
624fb79dadc1b65757986a9d0fdde5c0cf3fe179 is the first bad commit

Bluetooth: btmtk: validate WMT event SKB length before struct access

This is a stable backport of upstream commit:
634a4408c0615c523cf7531790f4f14a422b9206

Reverting 624fb79dadc1b65757986a9d0fdde5c0cf3fe179 on top of v6.18.30
fixes the issue and Bluetooth works again.

Please let me know if there is any additional logging or testing I can provide.

#regzbot introduced: 624fb79dadc1b65757986a9d0fdde5c0cf3fe179

Cheers,
Baley
