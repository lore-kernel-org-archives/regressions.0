Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238465;
	b=LCDqKXRprsH9i8upgtOb1ODf4PXZp+IpfWBWMPmuUQPytmxHUMghK7V2bPCgV5NcsH0G
	 gFx380hazrsF82upDUnKtArXMsZXROfbofg0dGBaIGDtzNj4RcoeSN6DYeoYll4nWMizQ
	 K48NPuai/O6MmhL8aJLqyuz7VSy/G+2r9nHr0iPPBGVaJnvpYKjQPLwLubSO7TAY3eS7y
	 eIOs28uTli9APPCNXmwn9uHzl9pg9X8IGYtL2Kl8uu9VmVTAJtKcxk/CiBTCU/uC59OWz
	 XV45lYABH3zt2QSG3DCmF/RgB3AZVVXp38R9PYD8je9Oec5BQJD4+g6nJAjx7Bm1HGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238465;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WVukrYsPbFF473s2K9zf2mkSZNUUvvxXMXskigLhwhY=;
	b=272NoP53No8gZ+P8fmt6QzhckDZOznL7nTfwxGhSjOK3PtAxj+3osWprCw61PNwXmOKI
	 jWLjFsfYMJfXNxwr6J/Ta/ZPzFQSzVgqjwIj/UCMC0HAc1KW00f/kvpDrZ47vVvuOEA8B
	 oxPvmRJw02NbncUwbiIbEXAFTVrNa6KCs8P3F1hDY60WzRlvkJVENw0IzD1zSPGy1kXeS
	 aJg+3iJOrBDvQB1S4g/UzCSEXFnPGiFuJYALpWm6rJQbu9N7GRNFaDY+EihSeBE6VumnG
	 3KjHhtWNSNpygISu8oige7LbEiQZCmp0eSPUhM8gzDWYC+OCnVp00lqZVqwUX4/0BAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SyZv6cOA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F911606A31C
	for <regressions@lists.linux.dev>; Mon,  9 Nov 2026 15:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F911606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SyZv6cOA
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso808973c88.0
        for <regressions@lists.linux.dev>; Mon, 09 Nov 2026 07:34:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238465; cv=none;
        d=google.com; s=arc-20260327;
        b=sbXM4m4/czgvoQ+1R3RaRluBcx76bBdvEVkhexkwgZNjVxnRUMRWAV88TQ4LF4X3i9
         Ff0ajfH+yVY7cmdVRJkz/kWEpcFnURppffz5Caq9x2pxFQcMmH+RvJU74W9D+hWuECFH
         mwmJPSSm8RQp54f7R25w7H27RTd/849RLRlGatucHj9nYTKqMI0o5EKrqiBFuvbFcscz
         h3GQSRcUgqU1Ysk5A43yAGW993mq86sIu9Z/ToIAtm2HRoHO+4XVdcVQeLitEcWkek+w
         ylppD5gyxPcZcVYpUIUD7/4Lktq9UHKXhO1p6R39UXp403uf1E00Ac9v2DWAGK+IlkzY
         U5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WVukrYsPbFF473s2K9zf2mkSZNUUvvxXMXskigLhwhY=;
        fh=pD5JxETt4WOW0jf0ZcjVv5pLAtZ5+EYnCp3X2Zh589c=;
        b=i6wSJc7N8PpQtGlOf5YXwnOU8a124z5MBBpk+NFRWWVMhdOBwU/Vr37sleAUjGoC4E
         RvmrpjnmDYYLW+2bfLi0h6aIOVasVwjBroRshH/m5R5lfBjAReu1QscTOpZf5EJbKJWQ
         sSGe1JELzOo/UJNfZhZ5w0vj3uWlAXqASY7KMB2EsK2J3eBPw447tv1mRg85GemhUn0a
         Wpibn/cWaH0rbU0c2+Mv+3wLvAGkWWzQRP5CeqboW0HIlh9BLjc0lYGUgpOUFK+h/38R
         HMPrNfN2e56DMc3rHmwdWvpjYV6122pHAHn0jj4/SPE1slTuaG2uR8ZTAvugNDMQ0TQV
         qoSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238465; x=1794843265; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVukrYsPbFF473s2K9zf2mkSZNUUvvxXMXskigLhwhY=;
        b=SyZv6cOAttS4+iarOaMV2CSW2KNasl2/nElVQi3H1BOkhM0WPizdeBaQUcvSqR32Us
         bitIw6YfNLJf/+q953GfLxCT1fJfsmCNWSboNuehd7oX2aZcO0x2P5mkTcoSC0M51BKT
         uVAc8ouelTY2ntD3W94HC6phoKtWU19+SyC4F54F/aNjZvZ94SfDWecVr3yVr73eyE3W
         E78XLOd5qwBvW3Vio7MGUGSLf8eagghOQKvQ5wpF/rGjFkwIGHYuMlaFhnTFENQRp6TW
         t68VJWOn+ydTx6JratFAhvAP1dG/QEeUusMu4MtixLIR1T9MthETWgz3Uy0fcfNAsEWS
         H+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238465; x=1794843265;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVukrYsPbFF473s2K9zf2mkSZNUUvvxXMXskigLhwhY=;
        b=TYRUf/3ViLngMXyNzUWKpyaxJfwf2wapG/NuIVXmVOc3rccWXDnS2b32GBEGVvESTl
         UvAg//hVmqPUZYS7o4hBwmw00H5OyAp2hFNamULiT5v1I9UGZV9PARMj3y3obWRpjN/4
         EqqS9vld6Z5bn6Ec8B6xNh23TPjCPj99ueiTYQGgXVtCy/dAEu0WYRTLNUPf5Exh1oCD
         x5sBnq06IycfMbpZYO+lGI7l4OwbV+/sQY8/XcpWF1Txfml4/3Vix3JbgthwO0Ul1UwU
         /CfvPa6NUMwcYnyATZhmvWvhLNOcVzKDl1hSrA45gRWCt//U164uv+CxdtO/SdXivqAY
         As0A==
X-Forwarded-Encrypted: i=1; AL+hErHZuSRZ6T66/6p2cobVa1KhqInMc7qskCTr7fyNE2IsYg9Cws40ywj5U76B1hZhgYmEah7hZABC4A6wbA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8rLKq0IiAlfNgQMnIWdGLB2FGtB+tPfOiAtKWdbNZkb0bO1MiQ
	6ut/Dsx8zP8GlGYx34rMB66bEcq8Gv2nBe0EXoKjSxUA6fusmj8jtQFWn5K3vhim6SxdX16SKRu
	HoUpJnwt9jq0io7KtChiPAw7kdpywT7g=
X-Gm-Gg: AYBFou2mXlZDrqmEQ2CLRdZSDXHkaEk/os80vEk411I6cQbP/Pe1/rL1nDWO99Fkn1G
	7Jg9kJr2Xxqv0/JcwlOO/bOe93Qoe3538gDXHdendZsszAAPl7uaFeqvMSaLQW46hfLQz9fcidv
	A1x6RUzbSRzfde8mr6XNdnZXOLu46AiNaEy2JCV3p1X4LZ7kWoGReJXdXfvSeRReR7GMP8dLCf0
	ZF/J5YWr3bfk1OMZlS91eJfA5ruHXs3AHlDXD5Gl+mAo+pgECfnl88Ezm0M0g2jgs5fDV53wsEV
	RsCU61bumfEa/ax5ZYxz7mJIOeMxDP+RHrNZ0Q7VaUZpOeuKnW3V++t1Dau7Gib9OB60YwlIAwL
	iJ5JN2CL1EBtgGRNml4BLsyanE9zDshHTkMJAKA==
X-Received: by 2002:a05:7022:4388:b0:1ae:e0f5:2cdd with SMTP id
 a92af1059eb24-1b39feaebacmr8289891c88.28.1794238464457; Mon, 09 Nov 2026
 07:34:24 -0800 (PST)
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
Date: Mon, 9 Nov 2026 18:34:11 +0300
X-Gm-Features: AclHuK-BoccA8Cm9Huf8OBdFW57iTUEi1LolooeDp5MbFnpce5HgXJGPyHYeVk8
Message-ID: <CA+Kibh5hpfyLHFb=z=rPjCOsRp=a_9eVpj6HF9E9rXx3oHg7oQ@mail.gmail.com>
Subject: Re: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles
 cannot be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: Mingyou Chen <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	regressions@leemhuis.info, regressions@lists.linux.dev, shlyapugin@gmail.com
Content-Type: multipart/mixed; boundary="000000000000516e31065fd9b2da"

--000000000000516e31065fd9b2da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 2:28=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> w=
rote:
> Hi,
>
> Here's your quirk (inside the email attachments).
>
> Please apply it on top of my patch series in this email:
> https://lore.kernel.org/r/20261028112742.674847-1-qby140326@gmail.com

Tested your quirk on top of v15, built out-of-tree against 7.2.15.

Three problems:

1. The DMI entry does not match here:
DMI_SYS_VENDOR   =3D "XIAOMI"
DMI_BOARD_NAME   =3D "TM2209"
DMI_PRODUCT_NAME =3D "Redmi Book Pro 15 2023"
TM2209 is the board name, not the product name. As sent, the driver
falls back to default_quirks - four entries in
platform_profile_choices instead of three.

2. .return_code_at_end =3D true is needed. A WMI_FN_SYSTEM_PER_MODE call re=
turns:

00000000: 00 08 02 00 00 00 00 00 00 00 00 00 00 00 00 00
00000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80

function echo 0x0800 at offset 0, mode value at offset 2,
0x8000 at offsets 30..31. Head-first parsing reads the function
echo as the return code, so every call ends in -EIO and
profile_get always fails.

3. .skip_ac_type_check =3D true is needed; USB-C only board, AC type is
never CIRCULARHOLE.

Your profile values are correct - Fn+K emits hotkey events whose
value_low cycles 1 -> 3 -> 2.

Corrected quirk attached. With it, from a clean boot all
three profiles set and stay set through power-profiles-daemon, no
reverts and no -EOPNOTSUPP.

Two further observations.

Fn+K emits WMI_EVENT_PERFORMANCE_PLAN_ALT (22), not
WMI_EVENT_PERFORMANCE_PLAN (15); only the latter is handled, so
platform_profile_notify() is never called here. value_low carries
the resulting mode. Possibly relevant to the question in your v15
cover letter.

The platform profile does not affect the power budget. Writes are
accepted and read back, but package power does not change.
stress -c 16 at both ends of the Fn+K range:

Fn+K high low-power 4391 balanced 4348 performance 4217 MHz
Fn+K low low-power 1726 balanced 1825 performance 1953 MHz

Varying the order of the profiles gave no consistent effect. The same
sweep with --block-driver=3Dplatform_profile, amd_pstate only, gives
1464 / 3550 / 3519, so the drop under power-saver comes from
amd_pstate.

Correction to my first mail: ~35 W is not one of the three Fn+K
steps, it is the EC power-on state. The steps are 15 W, 54-60 W
and 54-65 W; the first Fn+K press leaves the power-on state and it
does not return until the next boot.

--000000000000516e31065fd9b2da
Content-Type: text/x-patch; charset="US-ASCII"; name="TM2209-quirk-fixed.patch"
Content-Disposition: attachment; filename="TM2209-quirk-fixed.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mw9f5r7t0>
X-Attachment-Id: f_mw9f5r7t0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwppbmRleCBhNDMxZDNmZWYuLmM2
ODAxMDdjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYml0bGFuZC1taWZzLXdt
aS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2JpdGxhbmQtbWlmcy13bWkuYwpAQCAtMTEz
LDcgKzExMywyNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGJpdGxhbmRfbWlmc19xdWlya3MgZGVm
YXVsdF9xdWlya3MgPSB7CiAJLm51bV9wcm9maWxlX2VudHJpZXMgPSBBUlJBWV9TSVpFKGRlZmF1
bHRfcHJvZmlsZV9lbnRyaWVzKSwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9w
cm9maWxlX2VudHJ5IHRtMjIwOV9wcm9maWxlX2VudHJpZXNbXSA9IHsKKwl7IFBMQVRGT1JNX1BS
T0ZJTEVfTE9XX1BPV0VSLCAgIDIgfSwKKwl7IFBMQVRGT1JNX1BST0ZJTEVfQkFMQU5DRUQsICAg
IDEgfSwKKwl7IFBMQVRGT1JNX1BST0ZJTEVfUEVSRk9STUFOQ0UsIDMgfSwKK307CisKK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgYml0bGFuZF9taWZzX3F1aXJrcyB0bTIyMDlfcXVpcmtzID0geworCS5w
cm9maWxlX2VudHJpZXMgPSB0bTIyMDlfcHJvZmlsZV9lbnRyaWVzLAorCS5udW1fcHJvZmlsZV9l
bnRyaWVzID0gQVJSQVlfU0laRSh0bTIyMDlfcHJvZmlsZV9lbnRyaWVzKSwKKwkucmV0dXJuX2Nv
ZGVfYXRfZW5kID0gdHJ1ZSwKKwkuc2tpcF9hY190eXBlX2NoZWNrID0gdHJ1ZSwKK307CisKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9pZCBiaXRsYW5kX21pZnNfZG1pX3RhYmxlW10g
PSB7CisJeworCQkubWF0Y2hlcyA9IHsKKwkJCURNSV9FWEFDVF9NQVRDSChETUlfU1lTX1ZFTkRP
UiwgIlhJQU9NSSIpLAorCQkJRE1JX0VYQUNUX01BVENIKERNSV9CT0FSRF9OQU1FLCAiVE0yMjA5
IiksCisJCX0sCisJCS5kcml2ZXJfZGF0YSA9ICh2b2lkKikmdG0yMjA5X3F1aXJrcywKKwl9LAog
CXt9CiB9OwogCg==
--000000000000516e31065fd9b2da--
