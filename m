Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342938;
	b=To0ZY64k16fi90gKaa2a9XqantEBHpskEpbfY1VjYZnEDy1FcMPfbHSmS64gLg53u46r
	 Qr0ZN0B4Q5mNXXt+snDFKkQvWKHlcwocRiz/+VlfnbtUtJR1gO6hONQBuW11hI7p8vUPq
	 1NKvBHyJDbhX3QneeTCE8sPyh1EyY8bTuOTj1/5OIyRIkXP0XjhCaU07DeYCcbCteouQr
	 Q1uv3HOTsfZ467of7dA6BzgcBMuMLuJyTGGCMJeoHGJjFKTHf4FtBmrqHxZ/UFGKm3Xr7
	 ON/Ymk2ftYWgJtwNp1O7NY8CO8KfKNH410qZzD7GjWZwUMOJPbz0x1LI+DcXWBIH49A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yShBhjtDnACgtvfq0J6kPqqs6WD4xF02nyZ5JWEefS8=;
	b=kyb495rsA1CZWB6sU0Gkl6zj4eOua+nieVCtjtI0M3I4kTN65CHwv2LV8IfXHRcC14bb
	 33SbF+QR/GYhgFcTapXvcEy8UPsxdu7pLIQxf/b/v2yUv/sFe5zoU8Wy8NyKHpSPqP4Ks
	 MWHIySXKeK9xQA3WFeE7iN+R4m5HISuFIzkOlbAK+RS6CNHtZAXU3aB09o8wg6Feb9m4e
	 8fm8g08Xm5oFSQJUkmfpxWlHl8i16WNgeWJnnZVbl8jHUka81wo1QKfe6g+DAEueEb9ZS
	 t8rtP4HJ7dZoIzZbf1wyQuNzDqg8L9mPUjfMM3QZY6rM9YOT9qhtx4Lx2zbYR4JT5yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hzVEsyqd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA07E606A321
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 20:35:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA07E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hzVEsyqd
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b244fb7fffso3049018c88.1
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 12:35:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342937; cv=none;
        d=google.com; s=arc-20260327;
        b=pi/lTyIiEvWE64hyaXh6v94TNslGUXrTZxEdbKaIkvoMoxZDROlBERNkht9hHorKIp
         poqxCwecinnQP2+DH2Xz9a1xmG2DDuru0r7f9pUSVGD5CUycnzyyd/2PTuIJKoTtEo7M
         RCbNomdEbQGw5KRtVGWlb4CniK6Thgji9BeVwp6g/TvnM+aoI+Mw3+Z800Vbhzpc8g9l
         xwmhNehk4tSaWPJD5fdaVHygjn0YdEPx/rXj3zsAG6OBrHj56OCQ9AQCuJK7/5sti+UK
         7mIYe0JDtWXdCzSMRTRyr922Z2tx6G4/S8YOZS00RaKLmTkiFMJsFA4AVf9Jm5Gd/izs
         lm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yShBhjtDnACgtvfq0J6kPqqs6WD4xF02nyZ5JWEefS8=;
        fh=EDuuAMGspOodsmYFFdifMokkVUOVcALA/P4K44N9h/c=;
        b=JfGW9B7VN58KWli23G6TIM5+PxTu7JjO+Qj9Fh8Loavxhp2pYLaD4J/WB+QAGZXOe/
         Pt8RMOZty6thlEGIbttdW9qOK0HXmLNfkEGGOiNaf4/CSjzmtAYwMyKNkHZCORIe34p2
         ejd3TdFm4hO83NxvM8J9l994OMwkWz2rfy1vIxg1jeGHZ2aTwQqDUqESw0vne9uSfyzM
         AdgK3EHJJpg0vv+FtI/KWFchrVKb6h/LnYI5m8Dr51gd5zouLkayA+zF+Ic4hh5hKcp9
         1iQ/mSwjTbyBTcHJWbiedvet3GA6OMP8ZhG5I7OrVsZC8TBd81lPxRkQnlWpQ6LyE5nW
         71/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342937; x=1794947737; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yShBhjtDnACgtvfq0J6kPqqs6WD4xF02nyZ5JWEefS8=;
        b=hzVEsyqdgS0JgeifolM1FMgpASEQxPTkd21Wp0QmSRlAXvKhWjrtVSoLN0Oi8wYXuy
         LE8CPKbdDG8JArcmQFe+ukN7FOLTxj0qnG8ZwEQ9+WUA4tFW1tUdmof2y5falohf78Pu
         rjBgIMx79I4HHRPJaKGGgAW4SSoMTPnppUYFq/vYgtcRMNpZjzwV62j8k7CGqtha9w0+
         j5iNuR+AU8MoTw34kAu7ziIjgm60FJ3IhirDlsNZ189N+b4vcN/aQ8EmcT5iTw2VGbic
         S5qDuyGQBuQL0KSyY9bK/FkIeFo5m0xurukA0nEyxrXcAhl9krnnEp+uvX83QQkKYbe+
         iGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342937; x=1794947737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yShBhjtDnACgtvfq0J6kPqqs6WD4xF02nyZ5JWEefS8=;
        b=lvFYwbvQjtVsEhXLDDvufhR8S0lRnCt5KICA0k9yINQxbX3NJm8kevo3DpfyUlTxYE
         JuZ3IN7ImiybKE0yg5thzDEsggIDPdrZCSxIM8Xj2/dPTuX+O14Kw4YxBY992fHo/j1l
         DZ55VUcFyOnDQZXYBJvuNb8I4Bbku1cBNxePE8G64Y0rYf5bX8fwCVYDgpZiNFvHUIMt
         BYIhPT9UK8w//NhQA43wsS0RlZvYU5XaV39Z5lHWjVNHAyftC1W2a/X9kvU3LKOfr821
         HOgiZfrmpnKG/OHtSOPKc5Q5BMQVYVJzI9gl83foxdZ7G8ImrDjFsrfA+gR9HPb6ltLq
         Fqrw==
X-Forwarded-Encrypted: i=1; AL+hErEZ0ZHNvKIPo0lYzmMwZabiuvKcBN6BqZj91o5/4MTpG5kDoWXyVLUmmwe1FOCSIFfSDf6v8fvGKswUQg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9chm+NslW1V3+QJZa51kcp/XVMCQAwS+y4+wcsBaBSt9wfKYEn
	ZF/7Zhrnmx66eCv6/K/q1hQVjIb8sJQPYUG3yICLbYvaPEVaCwXE4OI4kaW76zjG4hDIZB5k9ZZ
	1Kl0APsNoy++9C650MqR4M6yNEfp3W6o=
X-Gm-Gg: AYBFou3IMGJs4C8uX6ptAjmCdXZ1lnaAju243i/jsHl7q2gwO6OBrTSYUsIZOHQnMnQ
	5+T8saHPPBxT6wyslu/A9xK5d8W37ihEe5Tw32Qr2wKKQywFVK90tc4/qeBVaz0xvNevGuEzHYK
	VIG+CghdU9XAghzyhfL6t1PCcEcgtIte3DS8ncT84Ib3NJAirFoiQdtlEJ+49g8YWs6vbbPpUtV
	nqsrWomSX8H2tAnOUbIkIbTF9AmZKH6eH5EHgGTenTn/XIlQ3kCNjbQSLLiO8P1hoxYsdc+gOdq
	68B5BWaxj1R9EriEC2huTprKJA7aM/62H+LBJpMMk02ODQmj9GeLUFvMYzZeqk0HH/VN4dQj3fb
	yVQ3FMPhC0M2V0rr0XOfcPjxtrdnWIcsS5LOseg==
X-Received: by 2002:a05:701b:280a:b0:1b0:c224:5bdc with SMTP id
 a92af1059eb24-1b3c02f0c64mr2919c88.14.1794342936296; Tue, 10 Nov 2026
 12:35:36 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CA+Kibh6FHk-QgmPsi4spmQ5MHGvt05xYHuRiiMMQdPP+31Z70A@mail.gmail.com>
 <f718e7cd-24f1-428b-b9f7-28bb1a923a11@gmail.com> <CA+Kibh6T9tPKwhSF2X5Jwoo8OUoieypuAyM4GBKVujUDWgpr-g@mail.gmail.com>
 <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
In-Reply-To: <08e0f238-4330-418b-ae3b-fa7ce0f6ef62@gmail.com>
From: Oleg Rybalov <rybalov.oleg.dev@gmail.com>
Date: Tue, 10 Nov 2026 23:35:24 +0300
X-Gm-Features: AclHuK84S-wSVuEwuytdxrmUZgbKUipecVgBYTEbrwAjz9A0BoyUxR2Lz9GtGDQ
Message-ID: <CA+Kibh4GtWjz97Fnxa3n8-B9+dTtcG5oPtn8b3HvcpUcR3Su_Q@mail.gmail.com>
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com, 
	Musaev Ibragim <atomicus.xyz@gmail.com>
Content-Type: multipart/mixed; boundary="00000000000053a8f3065ff2054c"

--00000000000053a8f3065ff2054c
Content-Type: text/plain; charset="UTF-8"

Follow-up with what I found while testing, and a correction.

Correction: v15 does handle WMI_EVENT_PERFORMANCE_PLAN_ALT, so
platform_profile_notify() is called on Fn+K. I misread that earlier.
The profile did not change in my tests because profile_get read
SystemPerMode, which Fn+K does not seem to touch.

From the decompiled tables, as far as I can tell, the mode on this
board is a byte in EC RAM, STNM (\_SB.PCI0.LPC0.EC0, SystemMemory
0xFE0B0300 + 0x7E). Fn+K raises EC0._Q24, which notifies WMID, sleeps
500 ms and calls HPTC (STNM). STNM itself is rotated by EV20 case
0x16, which runs only when the event is read through _WED, so without
a driver reading the event Fn+K does not change the mode. HPTC appears
to program the SoC limits from STNM.

What I observed: with your quirk loaded, writes to platform_profile
returned 0, but STNM did not change.

Attached is a patch (written with an AI assistant, feel free to reuse
or rewrite) on top of v15 that works on my machine. It replaces my
previous one. It may well not be the right way to do it in the driver,
I'm sharing it in case it helps:
- profile_get reads STNM with acpi_evaluate_integer()
- profile_set writes STNM via ioremap under the ACPI global lock (the
field is declared with Lock) and evaluates EC0.HPTC
- AE_AML_BUFFER_LIMIT from HPTC is treated as success: SVRP sets the
size field to 0x12 for three 5-byte entries (0x11 bytes), so A032
starts a fourth entry and reads past the end of the buffer, after the
limits have already been sent. The ACPI error is still printed to
dmesg on every profile change
- The capability check still applies, and on this board it gets in the
way: on battery, setting performance fails with EOPNOTSUPP and
power-profiles-daemon rolls the profile back, while Fn+K selects the
top step without problems. The firmware already bounds the limits by
AC state and battery level (HDC1..3), so the check looks unnecessary
here

With it, on AC, through power-profiles-daemon: profiles set and stay
set, Fn+K changes the reported profile, and package power looks
consistent with the firmware tables.

Not covered: the address comes from BIOS RMAPH5B0P0909 only;
profile_get returns an error if STNM is outside 1..3.

Cc'ing Musaev Ibragim, who tested the Redmibook side of this series on
the same board and BIOS in July.

--00000000000053a8f3065ff2054c
Content-Type: text/x-patch; charset="US-ASCII"; name="TM2209-quirk-ec-mode.patch"
Content-Disposition: attachment; filename="TM2209-quirk-ec-mode.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mwb5fy770>
X-Attachment-Id: f_mwb5fy770

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwppbmRleCBhNDMxZDNmZWYuLmE1
ODZjODNhNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYml0bGFuZC1taWZzLXdt
aS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwpAQCAtMTgs
NiArMTgsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgogI2luY2x1ZGUgPGxpbnV4L2h3bW9u
Lmg+CiAjaW5jbHVkZSA8bGludXgvaW5pdC5oPgorI2luY2x1ZGUgPGxpbnV4L2lvLmg+CiAjaW5j
bHVkZSA8bGludXgvaW5wdXQtZXZlbnQtY29kZXMuaD4KICNpbmNsdWRlIDxsaW51eC9pbnB1dC5o
PgogI2luY2x1ZGUgPGxpbnV4L2lucHV0L3NwYXJzZS1rZXltYXAuaD4KQEAgLTk5LDYgKzEwMCwx
MCBAQCBzdHJ1Y3QgYml0bGFuZF9taWZzX3F1aXJrcyB7CiAKIAlib29sIHJldHVybl9jb2RlX2F0
X2VuZDsKIAlib29sIHNraXBfYWNfdHlwZV9jaGVjazsKKworCWNvbnN0IGNoYXIgKmVjX21vZGVf
ZmllbGQ7CisJY29uc3QgY2hhciAqZWNfbW9kZV9hcHBseTsKKwlwaHlzX2FkZHJfdCBlY19tb2Rl
X2FkZHI7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGJpdGxhbmRfcHJvZmlsZV9lbnRyeSBk
ZWZhdWx0X3Byb2ZpbGVfZW50cmllc1tdID0gewpAQCAtMTEzLDcgKzExOCwzMCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IGJpdGxhbmRfbWlmc19xdWlya3MgZGVmYXVsdF9xdWlya3MgPSB7CiAJLm51
bV9wcm9maWxlX2VudHJpZXMgPSBBUlJBWV9TSVpFKGRlZmF1bHRfcHJvZmlsZV9lbnRyaWVzKSwK
IH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9wcm9maWxlX2VudHJ5IHRtMjIwOV9w
cm9maWxlX2VudHJpZXNbXSA9IHsKKwl7IFBMQVRGT1JNX1BST0ZJTEVfTE9XX1BPV0VSLCAgIDIg
fSwKKwl7IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQsICAgIDEgfSwKKwl7IFBMQVRGT1JNX1BS
T0ZJTEVfUEVSRk9STUFOQ0UsIDMgfSwKK307CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFu
ZF9taWZzX3F1aXJrcyB0bTIyMDlfcXVpcmtzID0geworCS5wcm9maWxlX2VudHJpZXMgPSB0bTIy
MDlfcHJvZmlsZV9lbnRyaWVzLAorCS5udW1fcHJvZmlsZV9lbnRyaWVzID0gQVJSQVlfU0laRSh0
bTIyMDlfcHJvZmlsZV9lbnRyaWVzKSwKKwkucmV0dXJuX2NvZGVfYXRfZW5kID0gdHJ1ZSwKKwku
c2tpcF9hY190eXBlX2NoZWNrID0gdHJ1ZSwKKwkuZWNfbW9kZV9maWVsZCA9ICJcXF9TQi5QQ0kw
LkxQQzAuRUMwLlNUTk0iLAorCS5lY19tb2RlX2FwcGx5ID0gIlxcX1NCLlBDSTAuTFBDMC5FQzAu
SFBUQyIsCisJLmVjX21vZGVfYWRkciA9IDB4RkUwQjAzMDAgKyAweDdFLAorfTsKKwogc3RhdGlj
IGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGJpdGxhbmRfbWlmc19kbWlfdGFibGVbXSA9IHsK
Kwl7CisJCS5tYXRjaGVzID0geworCQkJRE1JX0VYQUNUX01BVENIKERNSV9TWVNfVkVORE9SLCAi
WElBT01JIiksCisJCQlETUlfRVhBQ1RfTUFUQ0goRE1JX0JPQVJEX05BTUUsICJUTTIyMDkiKSwK
KwkJfSwKKwkJLmRyaXZlcl9kYXRhID0gKHZvaWQqKSZ0bTIyMDlfcXVpcmtzLAorCX0sCiAJe30K
IH07CiAKQEAgLTI3MSw2ICsyOTksNDggQEAgc3RhdGljIGludCBiaXRsYW5kX21pZnNfd21pX2Nh
bGwoc3RydWN0IGJpdGxhbmRfbWlmc193bWlfZGF0YSAqZGF0YSwKIAlyZXR1cm4gMDsKIH0KIAor
c3RhdGljIGludCBiaXRsYW5kX2VjX21vZGVfZ2V0KGNvbnN0IHN0cnVjdCBiaXRsYW5kX21pZnNf
cXVpcmtzICpxdWlya3MsIHU4ICp2YWwpCit7CisJdW5zaWduZWQgbG9uZyBsb25nIHY7CisJYWNw
aV9zdGF0dXMgc3RhdHVzOworCisJc3RhdHVzID0gYWNwaV9ldmFsdWF0ZV9pbnRlZ2VyKE5VTEws
IChhY3BpX3N0cmluZylxdWlya3MtPmVjX21vZGVfZmllbGQsCisJCQkJICAgICAgIE5VTEwsICZ2
KTsKKwlpZiAoQUNQSV9GQUlMVVJFKHN0YXR1cykpCisJCXJldHVybiAtRUlPOworCisJKnZhbCA9
IHY7CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgYml0bGFuZF9lY19tb2RlX3NldChjb25z
dCBzdHJ1Y3QgYml0bGFuZF9taWZzX3F1aXJrcyAqcXVpcmtzLCB1OCB2YWwpCit7CisJdm9pZCBf
X2lvbWVtICphZGRyOworCWFjcGlfc3RhdHVzIHN0YXR1czsKKwl1MzIgZ2xrOworCisJYWRkciA9
IGlvcmVtYXAocXVpcmtzLT5lY19tb2RlX2FkZHIsIDEpOworCWlmICghYWRkcikKKwkJcmV0dXJu
IC1FTk9NRU07CisKKwlzdGF0dXMgPSBhY3BpX2FjcXVpcmVfZ2xvYmFsX2xvY2soMTAwMCwgJmds
ayk7CisJaWYgKEFDUElfRkFJTFVSRShzdGF0dXMpKSB7CisJCWlvdW5tYXAoYWRkcik7CisJCXJl
dHVybiAtRUJVU1k7CisJfQorCXdyaXRlYih2YWwsIGFkZHIpOworCWFjcGlfcmVsZWFzZV9nbG9i
YWxfbG9jayhnbGspOworCWlvdW5tYXAoYWRkcik7CisKKwlzdGF0dXMgPSBhY3BpX2V4ZWN1dGVf
c2ltcGxlX21ldGhvZChOVUxMLCAoY2hhciAqKXF1aXJrcy0+ZWNfbW9kZV9hcHBseSwgdmFsKTsK
KwlpZiAoc3RhdHVzID09IEFFX0FNTF9CVUZGRVJfTElNSVQpCisJCXJldHVybiAwOworCWlmIChB
Q1BJX0ZBSUxVUkUoc3RhdHVzKSkKKwkJcmV0dXJuIC1FSU87CisKKwlyZXR1cm4gMDsKK30KKwog
c3RhdGljIGludCBsYXB0b3BfcHJvZmlsZV9nZXQoc3RydWN0IGRldmljZSAqZGV2LAogCQkJICAg
ICAgZW51bSBwbGF0Zm9ybV9wcm9maWxlX29wdGlvbiAqcHJvZmlsZSkKIHsKQEAgLTI4MiwxNCAr
MzUyLDIwIEBAIHN0YXRpYyBpbnQgbGFwdG9wX3Byb2ZpbGVfZ2V0KHN0cnVjdCBkZXZpY2UgKmRl
diwKIAl9OwogCXN0cnVjdCBiaXRsYW5kX21pZnNfb3V0cHV0X2hlYWRfcmMgcmVzdWx0OwogCXNp
emVfdCBpOworCXU4IHZhbDsKIAlpbnQgcmV0OwogCi0JcmV0ID0gYml0bGFuZF9taWZzX3dtaV9j
YWxsKGRhdGEsICZpbnB1dCwgJnJlc3VsdCk7CisJaWYgKHF1aXJrcy0+ZWNfbW9kZV9maWVsZCkg
eworCQlyZXQgPSBiaXRsYW5kX2VjX21vZGVfZ2V0KHF1aXJrcywgJnZhbCk7CisJfSBlbHNlIHsK
KwkJcmV0ID0gYml0bGFuZF9taWZzX3dtaV9jYWxsKGRhdGEsICZpbnB1dCwgJnJlc3VsdCk7CisJ
CXZhbCA9IHJlc3VsdC5kYXRhWzBdOworCX0KIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCiAJ
Zm9yIChpID0gMDsgaSA8IHF1aXJrcy0+bnVtX3Byb2ZpbGVfZW50cmllczsgaSsrKSB7Ci0JCWlm
IChxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS53bWlfdmFsID09IHJlc3VsdC5kYXRhWzBdKSB7
CisJCWlmIChxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS53bWlfdmFsID09IHZhbCkgewogCQkJ
KnByb2ZpbGUgPSBxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS5wcm9maWxlOwogCQkJcmV0dXJu
IDA7CiAJCX0KQEAgLTM1MCw2ICs0MjYsOSBAQCBzdGF0aWMgaW50IGxhcHRvcF9wcm9maWxlX3Nl
dChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJZm9yIChpID0gMDsgaSA8IHF1aXJrcy0+bnVtX3Byb2Zp
bGVfZW50cmllczsgaSsrKSB7CiAJCWlmIChxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS5wcm9m
aWxlID09IHByb2ZpbGUgJiYKIAkJICAgICFxdWlya3MtPnByb2ZpbGVfZW50cmllc1tpXS5ub19z
ZXQpIHsKKwkJCWlmIChxdWlya3MtPmVjX21vZGVfYWRkcikKKwkJCQlyZXR1cm4gYml0bGFuZF9l
Y19tb2RlX3NldChxdWlya3MsCisJCQkJCQkJICAgcXVpcmtzLT5wcm9maWxlX2VudHJpZXNbaV0u
d21pX3ZhbCk7CiAJCQlpbnB1dC5wYXlsb2FkWzBdID0gcXVpcmtzLT5wcm9maWxlX2VudHJpZXNb
aV0ud21pX3ZhbDsKIAkJCXJldHVybiBiaXRsYW5kX21pZnNfd21pX2NhbGwoZGF0YSwgJmlucHV0
LCBOVUxMKTsKIAkJfQo=
--00000000000053a8f3065ff2054c--
