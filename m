Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350C22036FF
	for <regressions@lists.linux.dev>; Thu, 10 Jul 2025 04:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752123381; cv=none; b=UbIdqArUFIZ8TCmQzB8tpXZpes0mL9Cg+HvTpi9b/c8c18kwgzkAPdHkaHikyHEUnhINOejR1BNQQXc+oaRHxo4WEtzOfwOADez7QhwcDxEvgjLS7/9j5oelU3lkMZzCdKwKM55N/kV4hdekgw4D1U2s5yDnZnEonI0O98cBCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752123381; c=relaxed/simple;
	bh=yoYShoaIiXR3w5F9oxenNhPzVKXL6kFxBM5IHG70IRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pd4b70teBI6sojxHczhBgK/93nEiyqGWJnn/dTGJE6kJFhiBvSVW+0q1gw8naKoIclJLbyHyHynwyUE2Ux3YlU0+uiaqwIcX9kdiowp+VL3A+LcQIoNCy4Itbt8juYZ8vq71SqDbPTUZWYOjjnB2qIevKE9cacRapTr14OQ+v54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FcM0TkDR; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FcM0TkDR"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87f26496daeso233792241.2
        for <regressions@lists.linux.dev>; Wed, 09 Jul 2025 21:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1752123379; x=1752728179; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yoYShoaIiXR3w5F9oxenNhPzVKXL6kFxBM5IHG70IRs=;
        b=FcM0TkDRriAzNp0CwlSl9Psg3zis2mYo13YNZVv7t5VPjcNKokAzXeGiYVMTMN+v+p
         ESGUmZqW+jwD16SCpEZClrnnNM11mfWAugTMfFuH7xd8/I83r/sT45MelkiP1zZQ6ekO
         Qe5pvyztJJ0tJFINSR4AwK7YqwRGJXJubTZ7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123379; x=1752728179;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yoYShoaIiXR3w5F9oxenNhPzVKXL6kFxBM5IHG70IRs=;
        b=lmkYsEvGIEvSjCsZ54SbyXFe+I7N1sFBseg5qUnLLeGnEUSolKaEHI+4t/Dw4wjjTR
         drnlGv8YCBDiG40yOaDvNPI7UBf46BC6p1aOUNwpj07UGUAoMrug2kQKjX7gYgHdA9pJ
         1Ec17ONzkZjhC3hdyIVR4DsVwpaD8lWh8jpvk02zD++aPRmtnMUjJpbk4oirTwmXlFSl
         xKLfOs2bAbVvFvwwossFEd+WUt0CI4R++ZkPYdwdSHGJAcS49G668iES1HJZ6xZbGl2M
         Urb9a7XocN/gY3h+P7wjNg0mHVG9AWqxzTqIneXsm5BoKAvCjRtIr2ZdCGInq0HaGyen
         2DOw==
X-Forwarded-Encrypted: i=1; AJvYcCXh81yVCn4bAeoh0tSbIIT3fkDCT11ybt8bMYj+knAyvi5Aug/viP8TMlIoFzZ0CzclbLqFyd7Y5axHgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7SAwtmySIJZFyiI19JA+4JqaUtRtFyHlxaMOqroUb+3jzhYJq
	ZpsApPpTJs0fn+UW5U/pEN4TG/monlfdNNCkKHO73Z9I/0d7JDJRqpf08q6pTHWjqG2GZz8wM9H
	38Lu5W4PTr83ArZ4S+TzHChTH05BpIVAcpciZfKe9
X-Gm-Gg: ASbGncvFqcwTuEpEcZPZetqc9to6ame/lByJYUiPnKKNzgEV4HDtBYro/L2/3844VS8
	n0lzHg6T3OEQEB0ZmMNfEq4PFk6q7LDK8OWv6eP9ihthsyFSWs3WMXAxilTwif9BgBwzrJE9Js0
	s/w8Sqh3L4NKXBtSjzrpqZ/SHOZ1EhXE34hQsB7Q1F88Q=
X-Google-Smtp-Source: AGHT+IFzs97Dddx7FNhI64YbIS8Rx6OltW9IW20sNOOzblps6/5oY5gO8vvwnu78AMYV5yRt1nkQT7p69PYqaE4VJzQ=
X-Received: by 2002:a05:6102:dca:b0:4e2:beb9:191 with SMTP id
 ada2fe7eead31-4f62e1adecemr629501137.20.1752123378841; Wed, 09 Jul 2025
 21:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4baJtp-j_IHshbbcugGEFuYVWNnoYMQ_-KELjaMMYPw1XwqyMJgfW4tO-hj1UhMId4hypNTOZrucUaOGx4qb3E-fIvhqS289kwlu_LR9nH0=@proton.me>
 <2025070938-abiding-speller-23be@gregkh>
In-Reply-To: <2025070938-abiding-speller-23be@gregkh>
From: Ajay Kaher <ajay.kaher@broadcom.com>
Date: Thu, 10 Jul 2025 10:26:07 +0530
X-Gm-Features: Ac12FXwvlXU88kjs6bXCHzFaXIxap9g2PsdUPaAH_4psVrIMCaIVnR6b-7Iv_ac
Message-ID: <CAD2QZ9ZoBJYHq+SLvw07Uo5Cp5tqMoDjOGY+TbJHaEUB7ODt9A@mail.gmail.com>
Subject: Re: VMware Workstation Pro w/ recent Kernel-6.15.4
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christopher Turcotte <clturcotte@proton.me>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"alexey.makhalova@broadcom.com" <alexey.makhalova@broadcom.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Prajakta Malla <prajakta.malla@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000a08be006398c037f"

--000000000000a08be006398c037f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 6:39=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Wed, Jul 09, 2025 at 12:42:02PM +0000, Christopher Turcotte wrote:
> > Good morning
> >
> > I'm hoping for a resolution to an issue I'm currently having with the l=
atest kernel release and Workstation Pro (Free Edition). Every time I try t=
o open Workstation, it's prompting me to reinstall modules that ultimately =
fail (see screenshots). Also see the attached log file. After doing some re=
search, I see the issue is that several header files are missing. I've trie=
d to manually compile and install original modules, but with no success. I'=
m still faced with an incompatibility issue and the latest kernel. This pro=
blem does not occur when I switch back to kernel 6.14.
>
> As you are using external modules, please contact the authors of them as
> there's nothing we can do here about them, sorry.
>

Thanks Christopher for reporting this issue.

Please note that Fedora 42 is not yet officially supported as a host
operating system for Workstation.
Refer following link for 'Supported host operating systems Workstation Pro'=
:
https://knowledge.broadcom.com/external/article?legacyId=3D80807

- Ajay

--000000000000a08be006398c037f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
fEfjRz/Z5b6J+pnCj2dzb2Wir3qx4rt1/aShjQasncmTZ0r8rOk2G3RmKolDmTmWPMeCgzL2KeQs
QRXTsKFFi0np4iUyWo+MDCofsswor1HkoXwlmoIAdrFL+cw3qvOowpOB0pe3+G1rWNvJvYsOAzG6
2a8X0kwMSTEGjJgAX+jQjqwdP8C4ZxmE7n236E9GiM8kfhFFAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF2FqYXkua2FoZXJAYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQkdXtSp1Dzqn1C33ctprG/
nnkbNDANBgkqhkiG9w0BAQsFAAOCAgEAQbg6h5rEci8mKF65wFYkl7cvu+zaAia4d24Ef/05x2/P
WAuBmkkDNwevol3iJzQNwlOuR4yR0sZchzw7mXSsqBhq1dgSNbReQ0qJU0YWze48y5rGlyZvCB1Q
Z8FbyfrHGx4ZQJcjB1zeXJqqW6DPE5O8XOw+xTEKzIQxJFLgBF71RT5Jg4kJIY560kzMLBYKzS1f
7fRmy20PR3frP6J2SwKPhNCsXVDP3t0KC5dUnlUf/1Ux2sVe/6G8+G7lBCG3A1TaN4j9woYHN7Y/
U0LCVM46Gf7bFsu7RzwcrKtSOnfJ3Fs7V+IWCrTMvbCSQylAy3+BMkMGFZ0WwtXNLxbYIEhKAZmH
npugOtDKS6j4LkLxkHr/dTYZvfdOXZXTIlz8qTfkTKw4ES4KW3EGzfnRZCL2VD27/GAtt0hwPWrY
HL087+VQLA9RUVdfnigRjZOPWo//78ZaDd9PPWbLKqa6EIboR2nSV5miF9fQinDnxToBGplQEcXG
WwCF8syc/0n0xzLlb/IOwxmkzMizN/3/vVp5eGh64OGdhSwzZDBQuVS08Wgfd3nVHT6zh1F0jBgZ
ACv82jjjtABB+Tg1VZ0vcRr5ZzTC1WylB7ik6soemgWAgbrQfhNh0uHr9jq+NAbTA4wqUK6gA5LP
kPwzH0/UqVP+eM3EQII1r4Uiee8YifwxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgwc6GO95nPh0DhXVGYwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIFD6
vxsEiUHNVDj/oIgST8o/lDAcbg2P03GM599y+UT9MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDcxMDA0NTYxOVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAAMqsohcRLclUSPQbkkEsrJWnQRfdpt+J9X2whjv
NcmbEvIvOqEhBOK6y2eB9Bt5FuTShMyaJtscVqi5LXaF0jbqyTDkySbzuKFbaVdqIoUwyW8yuQrB
KwlXU13iyCzS+BcLp17sh9wjAB/ensA6mjJLt3J/JkoMRhfhn6r8fev+AmVHsgsP3pVGW0hEI34Y
EZn42Kb2HXOVIg1v4vk4THB2vPd5iULS9ehZ1BVjsab+xXoCSLnAlxh5LV2awtEoOHzybUlT3jgL
uIXMAvhqaNPbad7ZfEBFayQF9PtPZZnjArnWqM+ayEjQMMcGoi5NgAZNJMd2qPDyYatvbBkicMA=
--000000000000a08be006398c037f--
