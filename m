Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793401830;
	b=cU5M7RZKEK6lQdCBwks4pIChQqXbmJImR1GrunT+d3Oic3y+rS5Y/jL+PJlcGGJet6Q8
	 G+QdnuFeaaWdtZ0qa4Xo5KEGIsdfPX9hrMijqzYKL6TUJm8RNE6IHt9I/Q07GBBIq3yNM
	 VdaG/dIyWQCz/tzf+imrLxTHsBRR7x4MtNrS0VPF/eM/gRdW2u50r1abcXcX1TdMHVjQ4
	 4vnREVP3dHrxvlp6E/m5Bdkux+OsyYHVWXjFq32+tD50o+dils+ToGT8F4jikHKE5p4Ca
	 QJHFGIp6dskB9lzohQZGMj1dEnU4BxfZuOiQES/WADOV1n2GeqmwxQTbVFVKk+Gbn+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793401830;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=4VwvTTBIcy8GfEC9gKnWAMAueb2rC5Aeo5k4gbFYP9w=;
	b=NsZYX2yVw0c88Q2/dPe9XatCTeFkyBkcW36t9st1Brv2XYUHeLa51dzZXRzL9eqLYG3D
	 hFo3tclM3F1UnlDMpmxOsesk+VWzvJ4AvBYXPnvqS4TI/hineHzTf7BtpaYgPf58MxvIu
	 D5rNRg97WohqVoP8qKUyEdswu2zfCVq1k+avpuioohLWsCtlOIkr9xy01apccOuZlJrOY
	 C8PmCUXmwvdW+nzhRZfQlW1U7pRwi3jY9RAz5GDNqUagEwwJqvF7knIaxmJVrSG1PwOFD
	 kiBlzU3rl02ayWMfxzCX1KHmrYnPw1dYgUPCf4ydwNFvKWbALdf7fqLK/v7hh4qrNUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hI+Nkqv3;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B526D606A333
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 23:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B526D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=hI+Nkqv3
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so615063a91.3
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 16:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793401829; x=1794006629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VwvTTBIcy8GfEC9gKnWAMAueb2rC5Aeo5k4gbFYP9w=;
        b=F8G0Bgxc5u9feHxHZkSwV4HQmMND986jCodQuKaNmq2dWviLtct+NmOngESRSi0hCG
         6Sh3MVvthWRT7n/JWEA/LZa5L4sXbop8kiYrRvi4cvST3+k5Sowe10GQfDpqTpvjPmml
         8WPQlDY/IRo69qsXY1itglMBwICKBAJaVKiQAB6inckx/G9ytxUmEAI5Iy835dk9XcQA
         kkcA41F5W2iNSrg6j+LNngAboH7D6s0MekseT+J+Q/DU6mZSPrDvYFJNhOFppc7rWPCQ
         NmI0seeUAXuPB4APJIO2y37FEPz5Ca7lNMRsCHvr0ZlOojTvTpqC+8Igl2+8Wx64WipT
         rubQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6qR1tvFjH1pQSjsxJwPOabRz35W8tmoZ/aRPApI3stQUR5/J/dPpauIa7mQtiL0q0lrkrhfsJLuNG/A==@lists.linux.dev
X-Gm-Message-State: AFq9FYLWp/hpNwMtG2gWBnHpLKw1T27H/m9ojaEE46fxrBdxW+RgU5HH
	ZP9HZ3yUeM/GxHaBQ2xuYFN/oe5p1INd6L0c437suK2RuXH5IaOqFqkEGJagx+VHnOtUzofGXbZ
	sjISJIez2gxQMCYFGl1woU8G4i8UjKbNh4otfcLufAQwMTCAn2gz+oZKGTDmLjPNw2B6QMbCt/o
	ILotzMPgWD7sZq5iKKNRHeF0XdoXiFSBV4AnWu/5MuyQnObaU2U8ZRqPPdMfc4//9i2ol0HRYHo
	ovza5g7sW8GxDT6Cg==
X-Gm-Gg: AYBFou2E8Bhb34nQcVWgHdXUD0DhAe/M/DT1TASaqmNrv1ds/XDjY9AdfcPaxewwLNx
	8ZMnjZTvREjRgcUL0mwca/kWv0hsdvZKWtix693pkojMfkxsgZdpxVEQSnIUN3dgE+D+8MP4RF0
	d0xdbktULWvxV9Mi7wXgEmk5LvbsEOfjMai4opAtP5jZfLYf9aCaiy8oKcNw3qsEzAZB4xNTGne
	0HhmkWQ8m27sPAI8aABoWaxQJ/sYT0gi1gSg+x2vrVKKTBaC8kYoBJbASR8KAjDiOgOc1wUxpZa
	k+1aZKXRthfOZlDRSmRQKJZdkQ3tPyGMdPy2ItW4pcylE25RMUfxqH+9iUWsD+Yo10udCloN0yN
	cc77AqzRcUvmoO6BkR4y+sjJRvlz6FF27RGfLJprCYnbU/k0Pi/xHr9fg8IUem3xt6uu2TosNrD
	4QgokJtxN6f1mW4vLF5EMBQen3YyzA71dpuj8=
X-Received: by 2002:a17:90b:17c5:b0:3ac:7c52:faf6 with SMTP id 98e67ed59e1d1-3ae89574d7emr2985888a91.1.1793401828894;
        Fri, 30 Oct 2026 16:10:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae6e80415bsm4859862a91.3.2026.10.30.16.10.28
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Oct 2026 16:10:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c3f8e149ccfso56706566b.3
        for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793401827; x=1794006627; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VwvTTBIcy8GfEC9gKnWAMAueb2rC5Aeo5k4gbFYP9w=;
        b=hI+Nkqv39i6o5zQxECyo1Ys+lylNuuaUaJ3yaCMk2TxYFRbi1wjE4XkrmJq3o9eTFI
         MBeJ0rYx4xik5BVw1bKLbKsIgOQadtWP1xjrWT537J3llFrA+ybg+REwLJBAOIZbTWHu
         7W9mzsRB4rtYzjJ6Ar2Ub1RWXGMZNxAQEF6eI=
X-Forwarded-Encrypted: i=1; AKwUvBweMA/iuTRY6Eb5D39X8gnGcefo1gPYqhkNmJbvhUP7up/J6GuRHgUOKgpFe0Ks/eMJnuUhr3BVszbOvw==@lists.linux.dev
X-Received: by 2002:a17:906:c142:b0:c46:8063:220c with SMTP id a640c23a62f3a-c4ca7a09d81mr334386766b.11.1793401826719;
        Fri, 30 Oct 2026 16:10:26 -0700 (PDT)
X-Received: by 2002:a17:906:c142:b0:c46:8063:220c with SMTP id
 a640c23a62f3a-c4ca7a09d81mr334385966b.11.1793401826355; Fri, 30 Oct 2026
 16:10:26 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028114933.256298-1-vlad.wing@gmail.com>
In-Reply-To: <20261028114933.256298-1-vlad.wing@gmail.com>
From: Michael Chan <michael.chan@broadcom.com>
Date: Fri, 30 Oct 2026 16:10:13 -0700
X-Gm-Features: AclHuK9hJDTZaouUxzpKmWR-DkKmTaJI8qHS-cV9IrWrbtUnZMWGYhJMWGH5xP4
Message-ID: <CACKFLims7tJxbs-ozin-yTQ1W2Lf2Lc8mO0YH=m6KmP4a7nVTA@mail.gmail.com>
Subject: Re: [PATCH net v2] bnxt_en: Don't keep MSI-X vectors added before FW
 reserves them
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: netdev@vger.kernel.org, Pavan Chebbi <pavan.chebbi@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andy Gospodarek <andrew.gospodarek@broadcom.com>, 
	Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Jinqian Yang <yangjinqian1@huawei.com>, 
	Andrew Preece <apreece@meta.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d6c21e065f16e670"

--000000000000d6c21e065f16e670
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:49=E2=80=AFAM Vlad Poenaru <vlad.wing@gmail.com> =
wrote:
>
> When dynamic MSI-X is supported, bnxt_check_rings() grows the MSI-X
> vectors with bnxt_change_msix() once FW says the new rings would fit,
> and keeps them.  FW only reserves the extra IRQs later, when
> bnxt_reserve_rings() calls __bnxt_reserve_rings().  The MSI-X table
> entries beyond the function's reserved IRQs are not backed until then:
> the MSI message written when the new vectors are activated is lost, and
> the entries read back as zero.  After FW reserves them they are live but
> still zero, so the NQ rings bound to them signal address 0 and every
> completion on those rings is lost.  The next ring change (for example
> ethtool -G) then times out freeing each of those rings and the TX
> watchdog fires:
>
>   bnxt_en 0002:01:00.0 eth0: Resp cmpl intr err msg: 0x51
>   bnxt_en 0002:01:00.0 eth0: hwrm_ring_free type 1 failed. rc:fffffff0 er=
r:0
>   ...
>   bnxt_en 0002:01:00.0 eth0: NETDEV WATCHDOG: CPU: 17: transmit queue 18 =
timed out 5716 ms
>

I've discussed this issue with our FW team and they have confirmed it.
Writing to an MSI-X entry that has not been reserved by the FW will be
silently ignored by the HW.

...

> @@ -11701,8 +11702,23 @@ int bnxt_reserve_rings(struct bnxt *bp, bool irq=
_re_init)
>         int irqs_required;
>         int rc;
>
> -       if (!bnxt_need_reserve_rings(bp))
> +       if (!bnxt_need_reserve_rings(bp)) {
> +               /* FW may already hold the reservation from an earlier
> +                * reservation that was not followed by growing the dynam=
ic
> +                * MSI-X vectors, e.g. because the allocation failed.
> +                */
> +               if (irq_re_init && BNXT_NEW_RM(bp) && bp->irq_tbl &&
> +                   pci_msix_can_alloc_dyn(bp->pdev)) {
> +                       irqs_required =3D bnxt_get_num_msix(bp);
> +                       if (irqs_required > bp->total_irqs &&
> +                           bnxt_change_msix(bp, irqs_required) !=3D irqs=
_required) {
> +                               netdev_err(bp->dev, "Unable to allocate %=
d MSIX vectors, maximum available %d\n",
> +                                          irqs_required, bp->total_irqs)=
;
> +                               return -ENOSPC;

Once I rebase my net-next series, this will likely not be needed since
there will be infrastructure to scale the rings down.  I will make
sure to handle the case where dynamic MSI-X falls short.

The patch looks good to me.  Thanks.
Reviewed-by: Michael Chan <michael.chan@broadcom.com>

--000000000000d6c21e065f16e670
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCQf9MW
8gY4/IvNlcCmrTSqOnGovXPH4W+B1E23JSvk/TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjEwMzAyMzEwMjdaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBcfJ8I23esBU74IemJCMQgOH3mSRLwDKJj6yqZgxj/
NnAgmRMmQ9P8piRvR8+mGpb/6TqZ552GRyHx+uJLqYk6GoOl56DBkJrCPdAne5kxLiwBHoTexqR9
Ehz7F4fFV5jdLr282KyIRI2em4Q+0te7dmvfQLqB7k3F/ZBh6Ge+31KfBqkOoV2/fSbIVKQxi6e6
+IadfQ9qPHemjS4HfmU0czMezcqdG0w2dDs0aHreA3XH0mfK4hEnrGMjL+Zp8IYpTcYfsU3f0Jh2
9Etgde+MI+EqhEsuFFSD+3XBN37xkIKGopQfenWSwp1cx7cyzc+leofWa2sk9UobtNpz2Hwd
--000000000000d6c21e065f16e670--
