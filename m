Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6A0321445
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773162505; cv=pass; b=s8TRUGG9teyrS/WeUKsimuxwR9FSU3k2sL9cCTFSCZTGm5Mfl7BTu80cPNqWfS0Kv7sAATt0fwPOtR7wP1GotM5FFa7AsAhk3Yr7o2Mx89GbUKHMo+l23dTXZdKZczCQnzNr6MCV7/L/CAAS15kSqeodsh2raLtQtd7wWFMuX9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773162505; c=relaxed/simple;
	bh=2U/YHmnNSMXb4kAlU6UnBe9Ek70iIOR2VlkPsQRm5tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWFk3D7VwXNn9Dew6ZDn8yEyxmB0ZwdVWLPvNsL8SpDXKuxeK7Yuc52EGBZ97zfCbuhrxQBMjqrHxcguaF8G89YnqnKYBSwRK+yFVyxhQjFsoaaZIMel3Ce4DMjaa9sxl6HuhoMDpoD4veFuHdC3VfzaQFW9L9lMJprSSFZqtdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR1GFuTK; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR1GFuTK"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-466ed3bc95eso1092996b6e.2
        for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 10:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773162503; cv=none;
        d=google.com; s=arc-20240605;
        b=RycmfsLEuqFzc1ZtJnKdkZca9USAtlx8EBbKwXzLAF9JVlweV3AYCfFu4jeeoutQJP
         2HDCp7rNjuNkjp7WiO2IWw/rXqOiqGYW0c+xI/nGnM58MqSvS/zObSscPNIZu422PliB
         DsAAZVKgDNgZYqSjq/tuUKFaWJtiNehYp7nHApHviMHmZtWL9k7/c3OXNjAonG8Wnz3o
         7idr96KWBXrThLHB4OYBOOimEDBXG+2FKYMDASP3E7ditrhOdIgxAKRxNb+I94KTCIZo
         sZv333FaOrQcTK95+Rzor4pEneMkqsNjINXNUbJpRUA4Ya6vdz2ZPwC8otzUSS3F7rP+
         anOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SGjIKYsVg8+/FngR4cBfWixXzW+UJX175bX4IGrA7TU=;
        fh=nDH/VGuYebH8oMjzFvRD+gj6H6a39EdKd9UfmRcrQwc=;
        b=dl3NyMyoQzH8/z/VQcL1UIpZ2ywqAHslaz+numLnHputtHrWJNsnYMhp0OfKhxd6MJ
         K+xOBT08vauUXZJiWCZ6qHJUW5KSGJFuIrxpDrcQGcRekP4I1Ew5SFKFm0FeXRTpvL6G
         kH+ZZoCaE2C8xgykp+3uqm+2pP58q7lNZynsm9jNrSVTgDgzWNgR4AkSftbUK2dzdsat
         nBEct1s+fGMF6ujlkwScZ95PwhWJDtSHn28YzfUOX3/NRCVj3tRxOXeu3xarri+f+Spt
         vtj5mFwqYHneYtj7cmoQQsNc0gdz01AV1RsPZEqb8Tz0FsWa38azUZxzBTzC6KJOK403
         41Dw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773162503; x=1773767303; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGjIKYsVg8+/FngR4cBfWixXzW+UJX175bX4IGrA7TU=;
        b=RR1GFuTKIhRmYAQFITyojFEV/Z119vVH7l6Uj370Oxbd2GezA8Iex7WTTKO5xY3Q5b
         Sf+QjfKA1sVvY88Wam0SjTZwN5tRnTEJY4lPgfzWVesamaw6n7kGHhyAtfWwmIF+TmdU
         JRUduH9iGAuXFcIk6bbwQzT2uNMBoTH39+WRBabHRT10xpuLDIdAUmGbbXt0ad6lP6Is
         gTyT1utWU80LgpqzXBPtQXAP6bGTr6oWTJK2lDON2uitQI1fvy3xi5YVLhto1W7+LjSB
         DETa4RWfbq9bFKMEzAxoUJh6UeDFFucpoWKLFCy/FtwTJ5BsuvpE50Gc1ze+tuLPDUCQ
         AtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773162503; x=1773767303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGjIKYsVg8+/FngR4cBfWixXzW+UJX175bX4IGrA7TU=;
        b=AwfXmONIG5dN+VKF3o3IVzhcYseVPXCnHVz4HDlLQ9oL3GgAoFWaZmqqLWu5N367kn
         +LUeZXG8hhdRCTMS7MQIujVqHIL9AVntONBUtpUD7w5iyvYD3mC0ivXVv8BgUi1xbwwv
         rs46rg8tdBsOvzn0X5c2Mdvezu4R6Aomhzv7DiNEFORe7u1tc4rAqd47Zinqp2noyK3r
         M+KFAxshGN8gEQcti1sX9B2URL9oRFNFY2+Sw44WDJm89ynmPOpPkO6hjlDh2Bb4/vvJ
         MHOa2ap/ivNLOTh2Igrdh7YA9mc57Z9r3WQciFbPJHffWQlrkAc9LCuPqvL8sKNoqAC2
         BgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtn/+dNr68aZsk+EqzTXXlu8BzC5/jQPTzfPo54h2H0lT4WTzsOBaIB0PSMlAyy/K8PSIC95ZtL8NEKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzUYEBBhB9Ir7ktdqVjoZoFt9i5yRF1Do/QSDqx01qoRnrleE0
	nYMsKpfik9EF9xpGiEdD7dQkUy+lpCTlnXsWNks00Y1ghj29DtxVlC6rZEkE4i5ghr0uTHsTp5i
	Xu1oc5MO6gGvEWWCA9t2W679SnefiTbY=
X-Gm-Gg: ATEYQzxD3ww2rdxH6BZ6yscfsIuTmmE5Vvv0n0+c09aY31lKGLreYUuftB0kWPDpuIY
	JS7wG7oqlKCyveXHoeXv+jmoHQoS+f9NMpizCPPx+V/fMjvbSiJ/Q8MOmakzmhVcX7795qbjfAq
	Fx6+Cjnq3xlwa9SrNOc0SA5Yun5DweEooEuKRbLIn3ya1UAvln+TJ41uxquuppBXKQqLtTRTbU4
	0+nCDQKUKuJ4Tbcyc2STLuDJc50RgDJ7pmsNRhmXQm+Osvx+zyqnsZoVuUE4U1N1uTSk+RKQ7mS
	qyHxyQqmRQztcudD4EF3cJWipf+dDihuMgapcmG+
X-Received: by 2002:a05:6808:1a01:b0:467:3f4:907d with SMTP id
 5614622812f47-46703f4faa0mr4092974b6e.56.1773162503370; Tue, 10 Mar 2026
 10:08:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANkKV92bTD11PCXYzz60WSxcP-0UCM8xtnY4_WraEwQx6TMjaw@mail.gmail.com>
 <CANkKV91Zfp_Bn_koM=Tb5vHQbog2Ja72C819aL-49kQ6PWA_Ow@mail.gmail.com>
 <CANkKV93wfs7oxU8kiyPWeafOs+ugpZSPLQrea7wtoSuGEG+pPw@mail.gmail.com>
 <68d90523-33dc-451f-a825-72eaa1c4bcb8@leemhuis.info> <CANkKV91attPiZ4+6DQKcgG10apUbF6k5hs7aJBrfsnfc5jQCew@mail.gmail.com>
In-Reply-To: <CANkKV91attPiZ4+6DQKcgG10apUbF6k5hs7aJBrfsnfc5jQCew@mail.gmail.com>
From: =?UTF-8?B?UsOhY3ogTcOhdMOp?= <raczm0812@gmail.com>
Date: Tue, 10 Mar 2026 18:08:12 +0100
X-Gm-Features: AaiRm53_m8RHubFk28jWl6i2BWsGSUZYGC84-yNOq9y5C3SysgD3CzDC2At4lhQ
Message-ID: <CANkKV93zUMy3333wpsqyMjxOKecMh8-hdABVaG8sVfnKusaE8g@mail.gmail.com>
Subject: Re: [6.18.] ThinkPad T14 Gen 2 AMD (LEN2073) - Synaptics touchpad
 remains PS/2, intertouch=1 ineffective, lost sync events
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten and all,

I tested the issue on the latest mainline kernel release candidate 7.0-rc3:

1. Built and booted 7.0-rc3 without any additional patches:
   - The touchpad (LEN2073) still exhibits the same "lost sync" behaviour.

2. Applied a local patch adding LEN2073 to the Synaptics SMBus
whitelist in drivers/input/mouse/synaptics.c:
   - Rebuilt and booted the kernel with this patch.
   - Behaviour did not change; the touchpad still does not work properly.
   - The patch simply adds the LEN2073 PNP ID to the SMBus whitelist.
     Patch content (for reference):

--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -191,6 +191,7 @@ static const char * const smbus_pnp_ids[] = {
  "LEN2054", /* E480 */
  "LEN2055", /* E580 */
  "LEN2068", /* T14 Gen 1 */
+ "LEN2073", /* T14 Gen 2 */
  "SYN1221", /* TUXEDO InfinityBook Pro 14 v5 */
  "SYN3003", /* HP EliteBook 850 G1 */
  "SYN3015", /* HP EliteBook 840 G2 */

Additional observations:
- psmouse is compiled as builtin.
- Verified both with and without the `psmouse.synaptics_intertouch=1`
boot parameter.
- I2C devices are visible under /sys/bus/i2c/devices/.
- dmesg output shows:

[    2.288744] psmouse serio1: synaptics: Touchpad model: 1, fw:
10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board
id: 3471, fw id: 2909640
[    2.331172] input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio1/input/input6
[  252.979513] psmouse serio1: TouchPad at isa0060/serio1/input0 lost
sync at byte 1
[  252.980606] psmouse serio1: TouchPad at isa0060/serio1/input0 lost
sync at byte 1
[  252.981855] psmouse serio1: TouchPad at isa0060/serio1/input0 lost
sync at byte 1
[  253.008752] psmouse serio1: TouchPad at isa0060/serio1/input0 lost
sync at byte 1
[  253.009947] psmouse serio1: TouchPad at isa0060/serio1/input0 lost
sync at byte 1

- The trackpoint was previously disabled in BIOS; after enabling it,
the touchpad behaves slightly better, but the "lost sync" issue
persists and PS/2 fallback is still active.

It seems that on this hardware, adding the device to the whitelist
alone does not enable proper I2C/SMBus operation, and the device does
not function as a Synaptics touchpad under Linux.


Best regards,
Mate
