Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AE22FFDEA
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 22:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791152979; cv=none; b=kRmnDokcdmQhk3eQtnQmjedleZw3V2sz2r2vYRCMz57gYp0Po+uw40L9EVT1K0zqLdCFtolSMUIXdcQr/TQyxbXE+zn32vcCoLYs5pFIy34FTNY0o6YEM7jn2M45uQUvLoy9XuxZ6kpU9zFWCWdX9/6xZR6LrHnycnjnYEd6v+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791152979; c=relaxed/simple;
	bh=eZx1lV9q4W9SZJS83RgbzmpASW4NYoz4y1SyDvKLec8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdP0f2AAZ5GPc6j7jp7Gsw3SOnLOpZFoIMMOWGyDlR9WqvIPAVjpV5smky2V0VeIJTI1hrlV86qb2Y66v0+JvoQmbNkiEK19DS8KlhqLcufFNXiuWZIgZ5eIkMfbSsqd9rqyREVhACKQK0kmC17cgeAVa8g6FaeNGm2coT1nvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Y30dJuGf; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Y30dJuGf"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e4985211ecso1685545ad.1
        for <regressions@lists.linux.dev>; Sun, 04 Oct 2026 15:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791152977; x=1791757777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8PgxuuBYCUIssdj0yztBaPaTIO1bT2Qb80/RezYkeo4=;
        b=eZ/60HtbyxzxeuzZ6Zr2Qd1vsfyWds8w4/s72x+uIGFtqhHLkHpnM79/2V5n5g1K+8
         AiFtz7kQ9PY4uRe7ma2zzSxkO20bMOhTQhtxHeNHbeN+VuxmcUmB/I2lvMIP7F+M0yGj
         Iv2ZaoXH8vacuy1Pdk5VGrrfF0qOZRaI1JU7r5WojuqxE90Ol8HPvuizhgmB41NWecef
         sllsaAfRwrLe7J6bSOoSRmCT6YsFvVJhO3sQkLwPKjVErU3vQ36PbhFtITfwt0atOlka
         ZNoXbolgrHZJ5hXjpLUo52/zjjWJvyYl/JKbgXjPGV3IPfTtiRaVnd52vZxUrdEX2eqm
         Kz3w==
X-Forwarded-Encrypted: i=1; AKwUvBzkgspyaNS10s74vWnC1I/NzXwwx1a2Fj1W8b5vT0mu1bFHDf7Cq90E1H2Q/jsQSFzI/J1sz5KFN5CVWg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIBpBpM6+peJRxdpnJAfPIpe+OwbplADTj0mGJxQNrsYx1a76k+
	spIQaxrSPJbOLF3vTqc8agjGP6epc4Pjm8bdwDPcWX+cRgxsrBDUUgR+gekMScSqlQ64g+Ua/TI
	/GEX1XMFsAGQV++Yupd2cIOOtux8lKYq9k/z3eDWw+bX0XgFYyqu0TJMtBpLxgKZCfw6nRRnkXK
	dpGhFfOk9K8+PmojR7Jehy7Std/x5sfJfmafaOmT4onp1WojF3Up97F/jmCttuCOqOOjGxXjQgR
	vMarNNUkk1Fe78QcA==
X-Gm-Gg: AYBFou3PWvbGbQOMwfyZ8Efmfka/Z+TwH3DNM2Degle77xd5zCpnm0MNj4/n1C4p7JN
	Z9RRoNM5zL1ou+e6n3qsbrPRpIaux6gW+j+GmsmO49vRFXXIL2h0I1uZCuy7+GWYqVv4c4Okxux
	LICTVUtBMxPuz+qgo6MvpxsoQ2Tuo3SUSHIhQpvkGs6b+Z7AiYMeuxeSJ/bxtjjGm4HFbt7JgK6
	zeHoWltlyoDCxVWyx5nklmiqq09gNxJ8loVfk+9XvqjFD2kGIyc2lRgHjXkU2toonMTWvR/JgvC
	xiu7n+P1w+UCgmA8pTb8opn+zAQoGt8OepY027LIFeoXpy5XFreyDOm0aLnNkQnR4ABJr1R+Lgd
	AvqDt0Ba78Uz6ICMPJl3LoUMgJjoACHFAFsURd4LBx+DjgofNWt/KXSDdABqACYDZ+Uc5YqlYHS
	tQWzvS1UxTLeJB3i6IzICPW3PwzWU7oJdq3KqP+g==
X-Received: by 2002:a17:90b:2b88:b0:3a4:d476:e0e6 with SMTP id 98e67ed59e1d1-3a6ce83bea3mr6791491a91.52.1791152977329;
        Sun, 04 Oct 2026 15:29:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a81a076bb8sm51954a91.2.2026.10.04.15.29.36
        for <regressions@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 15:29:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c2e48dc5363so156728466b.0
        for <regressions@lists.linux.dev>; Sun, 04 Oct 2026 15:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791152975; x=1791757775; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PgxuuBYCUIssdj0yztBaPaTIO1bT2Qb80/RezYkeo4=;
        b=Y30dJuGfrWUnAzStz0MfMAN24CK8oBHNw4zHUkY60m0qSoc9bwVUH7l1HXSMFDza4r
         NjauSJHi6NS7Ge22CWTjaGXeihn7vQW2Q3d1NURcwqFjMi/7wpZab+5K8M3qCyG4+R7J
         YmDpTy8PpemQue0oGn43rJcEldjZV1F03R7gg=
X-Forwarded-Encrypted: i=1; AKwUvByqJzWZCrP0Ez5anOv1pI/0oNVhaGTfp5xuIm2T1XkZUUdqrErtH3TgTQIZF1UcRjbjwRJ0WEWN9ObvCA==@lists.linux.dev
X-Received: by 2002:a17:907:94cd:b0:c29:f5d8:9c7c with SMTP id a640c23a62f3a-c2e4af89b5cmr815107566b.43.1791152975268;
        Sun, 04 Oct 2026 15:29:35 -0700 (PDT)
X-Received: by 2002:a17:907:94cd:b0:c29:f5d8:9c7c with SMTP id
 a640c23a62f3a-c2e4af89b5cmr815107166b.43.1791152974854; Sun, 04 Oct 2026
 15:29:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261004122616.56714cbd@nargothrond> <f0c52ecb-b85d-4a53-8329-a8d2fd5d72b8@kernel.org>
 <20261004163532.3134dd41@nargothrond> <20261004192902.3ab3b7f3@nargothrond>
 <919dcfaa-005f-4bfd-8889-39acda5f7a92@kernel.org> <854f3985-a4ab-4014-b18d-9fead61602e1@kernel.org>
In-Reply-To: <854f3985-a4ab-4014-b18d-9fead61602e1@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Sun, 4 Oct 2026 15:29:22 -0700
X-Gm-Features: AclHuK82XpdJ6aUV-AeOoMZWPm7tuCGvPjyZuGpcDrm46DyjpESoCgDjVC3qc4A
Message-ID: <CACKFLine2gKepH57mg5j2YYWsX-qU8-EfJfnqWiYUEhpXL1F9Q@mail.gmail.com>
Subject: Re: [REGRESSION] Commit 447cbe95ebb9 causes IOMMU DMA faults on
 macvlan/vlan with bnxt_en
To: Eric Dumazet <edumazet@kernel.org>
Cc: Stefan Fleischmann <sfle@kth.se>, netdev@vger.kernel.org, stable@vger.kernel.org, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, regressions@lists.linux.dev, 
	Joe Damato <joe@dama.to>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000d7aa93065d0b4cde"

--000000000000d7aa93065d0b4cde
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 2:11=E2=80=AFPM Eric Dumazet <edumazet@kernel.org> w=
rote:

> A more polished patch would be this one.
>
> bnxt_start_xmit() needs an audit I think :/
>
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> index
> d7728d0c5b6e63ee72de9dea54426bb4c8b7a9fc..48e544544754b04cff891bda5bc86cc=
370e0aa0b
> 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -486,7 +486,7 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff
> *skb, struct net_device *dev)
>          struct netdev_queue *txq;
>          int i;
>          dma_addr_t mapping;
> -       unsigned int length, pad =3D 0;
> +       unsigned int length;
>          u32 len, free_size, vlan_tag_flags, cfa_action, flags;
>          struct bnxt_ptp_cfg *ptp =3D bp->ptp_cfg;
>          struct pci_dev *pdev =3D bp->pdev;
> @@ -672,14 +672,12 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff
> *skb, struct net_device *dev)
>          }
>
>   normal_tx:
> -       if (length < BNXT_MIN_PKT_SIZE) {
> -               pad =3D BNXT_MIN_PKT_SIZE - length;
> -               if (skb_pad(skb, pad))
> -                       /* SKB already freed. */
> -                       goto tx_kick_pending;
> -               length =3D BNXT_MIN_PKT_SIZE;
> +       if (skb_padto(skb, BNXT_MIN_PKT_SIZE)) {
> +               /* SKB already freed. */
> +               goto tx_kick_pending;
>          }
> -
> +       length =3D skb->len;

I think skb->len is not updated with the padded length here.  So the
HW will drop the packet seeing that the length is too short.  There is
another skb_put_padto() that might work better?

> +       len =3D skb_headlen(skb);
>          mapping =3D dma_map_single(&pdev->dev, skb->data, len,
> DMA_TO_DEVICE);
>
>          if (unlikely(dma_mapping_error(&pdev->dev, mapping)))
> @@ -759,10 +757,7 @@ static netdev_tx_t bnxt_start_xmit(struct sk_buff
> *skb, struct net_device *dev)
>                  txbd->tx_bd_len_flags_type =3D cpu_to_le32(flags);
>          }
>
> -       flags &=3D ~TX_BD_LEN;
> -       txbd->tx_bd_len_flags_type =3D
> -               cpu_to_le32(((len + pad) << TX_BD_LEN_SHIFT) | flags |
> -                           TX_BD_FLAGS_PACKET_END);
> +       txbd->tx_bd_len_flags_type |=3D cpu_to_le32(TX_BD_FLAGS_PACKET_EN=
D);
>
>          netdev_tx_sent_queue(txq, skb->len);

--000000000000d7aa93065d0b4cde
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
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCDXkdH
Hy8zu49O2ZTsoVpmTJuRCtItEFFFYNCY1Q/SBTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjEwMDQyMjI5MzVaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQCTumSds/WCZo3BFh7TU0Usi6d9wpGTraDaQwgWBKke
LdRq66YUklKwcTapkTRnq3wQeFcm0mNLHGkKuHT2RPY7KBKSY3sZuWa0W2zkOM5rpFbjttaKK0HK
+T3FaeCz+4aHi/4yd2MEfe+MStRSxNC28p04kV/o81oqTonR4dW1Zo59zaSSAiipK5dan/26M5X3
gLPS9KAeut2bhkb+DveyMGbQHD/2qhyJVnYMZ+3mmvWvyS2dkfJPJV/awz6LrZxN4GNbV5Yb/+nb
oaz15cjmfZLV42KiAisI7GXRIftC1auHncHqtRZfl0vXHfE/Mc017Ci5tHGl7/NkJ7UHKe0M
--000000000000d7aa93065d0b4cde--
