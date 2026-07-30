Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59127389118
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428213; cv=none; b=V+PSaADgOeCGJrpJ36oLLsiOESSH2KxMXQgJtSHkzCMqPrFYTpUy5AQwfjdlGZtaAehfb5Gkn/RWVSV0nxS/KV21KURwmAeNsTbUjouPZT+jTNXsqutMpbhOEnPxvqs2aCqXgiIePIkfSdHPfjaoWm1QXGMsLpME/buR6opyeig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428213; c=relaxed/simple;
	bh=vTL2CoCioo0C29r7W2+MFUas25/QqmMowB+wUM6mGTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pR+GXoG8NZr1L2Vr41gumVJwcJXg5aLNNx/i0CBQtto+YTPQcalQtYYeg7aT1NVwRs3rG7ok8Unray+X3xyZ6oMespuLs5M/Ei17/CXDdwJE+56yw2dUew2GldQLisYv/DOKEkMv2mxkWrCEDImFhGY5v1rLMzfddrrahIxp2Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cr3yqEcT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cr3yqEcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 679781F00AC4
	for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 16:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785428202;
	bh=vTL2CoCioo0C29r7W2+MFUas25/QqmMowB+wUM6mGTk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cr3yqEcTRxQH2d/5SbtkUkWZVOvUBke2+iadHZ9YkFjwGzKgb/vSkKOiL8wPKXFHG
	 hvjLQUlfs0S+CTUgKiU4hvFWJOHCd+T7saYlwC683eknvBgcj2KbwEix0z3tdGyXHV
	 cnEKTvlLMgfPkc29MI/84cW+/eoqxCN969yPGe5uR8g8qciiKQ6ZWRwTS7ODRcFOXJ
	 NmZ1wyszdXiLjhBSxYzE15C6cMspjPVa0LWi7yMrXKsQk3w+bEdGqj5YJUihK/EX1M
	 tkFqxii+70ZAWBufXXj3RAdIjwJD78mpwjSFEUkt0lfMyFgP1uLpLl/T1p1uDt4KQe
	 KJl63unhYwhiA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso2793146e87.3
        for <regressions@lists.linux.dev>; Thu, 30 Jul 2026 09:16:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqv5r+FTO8wPJX3giJOOkVWtH0aTJj050JQ5bWJ5WiUvWNRAk4LfWYQ/YrEaXKy/tlbJraDHgKlnSBpWQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiG3eba89KAJ6ed1lyCEfgjo+vZcrpv2C40cZ5gDXbzGm9zjpr
	1wLZLH0of5Kb1AnNCP//pmylYp+Juhph3ykpy6vYGXd3WtNmkfoo7s+QfTc+lr+WU2uc9ZWNwdL
	YfTDpEiUZry3Db6B+shnf4SoZ4mUEpXE=
X-Received: by 2002:a05:6512:b95:b0:5ae:ba47:e7bb with SMTP id
 2adb3069b0e04-5b2db36ff2fmr756325e87.36.1785428200820; Thu, 30 Jul 2026
 09:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <3353bdf3-4f33-44b1-809b-b0378bee5816@gmail.com>
 <CAJZ5v0h1kqDEBYk0k05rv6f2SJ7g+TN4FhBDJYZSVUctu-0FdA@mail.gmail.com> <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
In-Reply-To: <daf0bb9b-246d-437d-87ca-16706113b201@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 30 Jul 2026 18:16:27 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
X-Gm-Features: AUfX_mwZ5mGlfMgKYkJ4kGxNRS7Dq4qB-hx9LK75gZM3H9j-7RhwOVWynjj-T0w
Message-ID: <CAJZ5v0jByxtQ2tmNm_ZyyBnDMBNjuqQwD_367NRyGNzF7wQtRw@mail.gmail.com>
Subject: Re: [REGRESSION] usb controller fails to initialize on intel s1200btl
To: Julian Silver <mendaxca@gmail.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, rafael.j.wysocki@intel.com, 
	linux-acpi@vger.kernel.org, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000aeaf7f0657d665e7"

--000000000000aeaf7f0657d665e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 5:32=E2=80=AFPM Julian Silver <mendaxca@gmail.com> =
wrote:
>
> On 2026-07-30 21:55:14, Rafael J. Wysocki (Intel) wrote:
> > Does adding "intel_idle.max_cstate=3D1" to the kernel command line also
> > help, by any chance?
>
> Yes. "intel_idle.max_cstate=3D1" also helps (on kernel 7.1.5).

Thanks for checking.

Can you please check if the attached patch (on top of the current
mainline) helps?

--000000000000aeaf7f0657d665e7
Content-Type: text/x-patch; charset="US-ASCII"; name="usb-ehci-pm-qos.patch"
Content-Disposition: attachment; filename="usb-ehci-pm-qos.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_ms7psosk0>
X-Attachment-Id: f_ms7psosk0

LS0tCiBkcml2ZXJzL3VzYi9ob3N0L2VoY2ktcGNpLmMgfCAgIDEwICsrKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCi0tLSBhL2RyaXZlcnMv
dXNiL2hvc3QvZWhjaS1wY2kuYworKysgYi9kcml2ZXJzL3VzYi9ob3N0L2VoY2ktcGNpLmMKQEAg
LTM4MCw5ICszODAsMTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBlaGNpX2RyaXZlcl9vdmVycmlk
ZQogCiBzdGF0aWMgaW50IGVoY2lfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25z
dCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqaWQpCiB7CisJc3RydWN0IHBtX3Fvc19yZXF1ZXN0IHJl
cTsKKwlpbnQgcmV0OworCiAJaWYgKGlzX2J5cGFzc2VkX2lkKHBkZXYpKQogCQlyZXR1cm4gLUVO
T0RFVjsKLQlyZXR1cm4gdXNiX2hjZF9wY2lfcHJvYmUocGRldiwgJmVoY2lfcGNpX2hjX2RyaXZl
cik7CisKKwljcHVfbGF0ZW5jeV9xb3NfYWRkX3JlcXVlc3QoJnJlcSwgMTApOworCXJldCA9IHVz
Yl9oY2RfcGNpX3Byb2JlKHBkZXYsICZlaGNpX3BjaV9oY19kcml2ZXIpOworCWNwdV9sYXRlbmN5
X3Fvc19yZW1vdmVfcmVxdWVzdCgmcmVxKTsKKworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyB2
b2lkIGVoY2lfcGNpX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikK
--000000000000aeaf7f0657d665e7--
