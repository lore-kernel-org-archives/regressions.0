Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792592045;
	b=1IBDQAt99L6+QsUF1wM2uZi5IleraDnhH4J73o0nqKjyeZgIFAFUOVZ5fHSrGxbfvkfW
	 IEaTlOQTmfRh4u6xFovMyfw2PBUqhU9tdcD+Q3JsHbhXdInh+tT2Q1sZryB6KoCWOLZvC
	 m7ITvly22GPD8dYI+0PzMv5k+X3t+0dNtca2RnIuIIsTiO6pbxbeAVyCcWY5EY3Zw51EO
	 wJt2F2qfq7bj1F3cB7501aFdVDNWnmn5fZ9qPX0UXqKEklxMQPVELpI+d+AVR2sGUc0n2
	 gVdbCCn5Q0fJT0TfSj9XNqvmyG8ONvlkOxDf6mPFlSmnlgsOtI+Mgm4WVN826SI3zKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UJ/A60pshTDV64EOc8/U0dsozGI6wHG2kt68wdBZvGk=;
	b=xVZadRW1cwhkF/4h78yCX5Ffs3fx3KItqLPN/5ThjnVOaTIhGPlRft6AZgXPkvirqKKv
	 9/zzAhfhuYv67D1x12eCSsiyiDjviJZUkuC5rCqvJHvbJ+LPqeCt/ecDUYY9s5A+LZIEO
	 1q0htTUxXYnCop1JPIQEmXr2vQ/u0JETjLlZhEQC1ETWXVr1Cu1ViC9vbHC9+Mj8fXq8b
	 S8AHsKWXSlc+K2QjROdUB65Y6aDsAnZomPgCZeY/KmvIGUOClw6nGAo+AcfXCSG2SXahr
	 UDUkjy2UUuxSf80DUpCqYW1X0kBf/pJwpMaMErmD3+kOCzt/Ua5HpAe+icCZwVEjSOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fDqQJgG9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7A606A31B
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 14:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81F7A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fDqQJgG9
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9906034086cso260194241.1
        for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 07:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792592044; cv=none;
        d=google.com; s=arc-20260327;
        b=CoksdcelVFAwMr4jutBVBlJQ6Y6bxEGyRl9LT9dVflqQMMeJoYPT9r8eJnt1501B2n
         YVP567k+K2Yz3xdPo9ePHyykNuIUmiP3vYLUo8BpOYolPilnbpasRdXVQIGqKD2Wcuit
         BRzT2NbGZHDnVW442rM0MSP6Czccg7MPNj+N+FKYjy4KNpFOb3Rxsd+rUDWezSy+eBi7
         qhNoU2+6h/5PbnUax5YtqD4Rd9QWbnZ7r/w7XvaYVHL5mei923BgiD/gqzfiYzFbxtBQ
         jNhUTDofJXW/9MEVTCHzXZuyDDJ1d6D8EpM2DCWo4lsldZwl3fEMl/MRZltv3TZM3jWz
         K8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UJ/A60pshTDV64EOc8/U0dsozGI6wHG2kt68wdBZvGk=;
        fh=hrCMA7nF/St9ZDZe2451l18YpWSupUIQmYbFfhrxGe0=;
        b=JCTaerCMrGloeLv8MbHjjoiXGHmyi9AZ+XzCyRGQmh4yJVrdZB1MABLCsKUoDbKrdQ
         jYqEBmrRdm9GuVOAt+olJFBo2yuaPqeP5SrmWytxbzQs8Hrt+HCpJ73mWmK2bUW8u08L
         TrOd7+1JDLcg0t+Q5rWhAGC4PcesDYEghXXTV5D3X2mO+Bbydw84RW+geQHqXMWuoTGo
         hiVLREtw4eLZxDqRDoVMoS8kqUBLVvd7P+XJ78S1rChd8JgjoYPCOo4J+5w9s/l+/7G0
         YpNkaOk2lElXfH3iMLJaPeoNfp2+NdszMYRR5udY6WjoC4XLaLcT3dQsO/MXR+FgAese
         jfjw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792592044; x=1793196844; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UJ/A60pshTDV64EOc8/U0dsozGI6wHG2kt68wdBZvGk=;
        b=fDqQJgG9+bJEE6+Zy8U08Q1LqNm9OZOT6kDjUrhNiCxzj+Ns6OgnpV9ZT0i3rY7iuj
         jKvpbliJhH2AjnC2rmQ0FMRc+MO13kzrdC6NuDb/Zomc4ynoPJKwMB8vbXNh/z4t8O5n
         34PAkVZ4FKbsgcULiP1Uke9Pcs/J9tEuVnO6w/sF277vxzxvCSyGg2XoMmw43z+vDPNO
         Ci/3w2Q4pd9lAbo6mINGnkhtS2YYnRp5Zo3jR3yA4FCrgl7QxwIOfXxzgsYaiJjcPEOF
         3UjI/SNrl5afox2tLLTpf5ckQxzwveDVowszvB4B4KW7JPXE2oTcaIFOrgAdFfK9koMK
         r05g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592044; x=1793196844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UJ/A60pshTDV64EOc8/U0dsozGI6wHG2kt68wdBZvGk=;
        b=0t+5LP8MgYAl5xUTRFiO2FG7vjSKPiIGJLl4BHxyT2X4P/ATY/Jm5OmTwnRVxyul17
         cp03G9wt2tz5/RjnD/w5kZoJStzCTHEiKhdvpG4SuT7NymNL/dG0vH4d55ZMDLzuvU+Q
         I6L4gbTNvV8ezstZ04Shd/4WBvC7sgqp7Wn/XOu8+AdwebT1ymfZkS25xRtUQU+Vlng2
         bQZDkoPlIwPohI/nTaI03KXmUw5hDjuuFsc30y+u48cq24gLZH1WrGGhVqFFkv6GQWuo
         54bUDjsTcR3aAaw/L4Ijuvt+WxqIe812VaBV0frESfzr75yvYJlqt2UaucERbqtf7ZES
         zjxw==
X-Forwarded-Encrypted: i=1; AKwUvBzm2rEEmtcdZcwDLXkSCKPe+IWw69LxlB9ixG60XX9vKeQbP/fpQVzk7VtzMJjjUOjipUgTlRHjTw1pVw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIOQ0Isd81ZgdCKmSi4aQFCHhDpk+G8j5GXfz2t/3UECK7TNsF2
	XHJ7xZjl2NEqIcjHUakdUYrf13MXzzjV1kYxNPMlE4ArtLx5BokqYqXrLXaBIhNuKCo+l1y4W+v
	47xSfL5TyFJRZJTtsH4x+Ib2PlcAw6y4=
X-Gm-Gg: AYBFou3i5oA17sIYYIdYtmqGrkwQUJmsUfRHPM4kCq8HoIwSvHs9Gvf+MVHKhmVmyBh
	SaWztDJUaX0ZFCpHzqB4Dl1htDR7fll2x8NnnaFeH7FrfZDuzcD0JKXXFF4nbjfW97dqojDRTKl
	KV18Qrp3XTmLABH+0LTs3oua2RmzwzhIS5sqhoNk2d6szLw+5ExA8QTUwS1Y8+KLgKkcHUyM5e8
	vXMzMyMnFgvWvyaL67svKQS1LJ6iY2NKneMi8XjTA1R39DgwvAuCjCaQalM2J/oNYysOaXfZ3gK
	wH6AOF8Jtf4iuCiqoJLVSsT7RV+l7So3XSm+Yz+gFmA82g4A8X7HOQL4BqfCENzPnUqhrQohukJ
	eJPehew0EfPyujyh9xHgZATHXWdRKdl4Pd8xqWhJBx1Ia+t8cnPDIsGVK2Erz47cN8nVvmg==
X-Received: by 2002:a05:6102:3588:b0:7a1:f980:e93b with SMTP id
 ada2fe7eead31-7cc926b0bc6mr656524137.23.1792592044313; Wed, 21 Oct 2026
 07:14:04 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021115400.30885-1-mike.michalo@gmail.com>
In-Reply-To: <20261021115400.30885-1-mike.michalo@gmail.com>
From: mixalhs <mike.michalo@gmail.com>
Date: Wed, 21 Oct 2026 16:13:49 +0200
X-Gm-Features: AclHuK-nUd4UmTxE9F3RBMXljFNNhLJJZePwWHLxIeXwrSoZlz9LU3TXba0QmGI
Message-ID: <CAO+rqLj5rF8MGMTRSav1n43NqLbazwyuPsPKgiQT2qtP+EDxeQ@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: restore Kerberos logins with released ksmbd-tools
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The ksmbd-tools side is up as
https://github.com/cifsd-team/ksmbd-tools/pull/347

Michalis

On Wed, Oct 21, 2026 at 1:54=E2=80=AFPM Michail Andreas Michalopoulos
<mike.michalo@gmail.com> wrote:
>
> Commit a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets
> expire") added a __u64 session_expiry field to struct
> ksmbd_spnego_authen_response, growing it from 156 to 168 bytes.
> ipc_validate_msg() requires the response to have exactly that size, so
> the 156-byte response of every released ksmbd-tools, up to 3.5.7, is
> dropped and Kerberos session setup fails with STATUS_LOGON_FAILURE.
> The other way round, kernels without that commit, including the stable
> trees, drop the 168-byte response of current ksmbd-tools master, and
> ksmbd-tools has no way to tell which layout a kernel expects.
>
> Pass the expiry in the reserved area of the embedded struct
> ksmbd_login_response instead. ksmbd-tools releases with that area
> (3.4.4 and later) allocate the response zeroed and never write to it,
> so they send an expiry of 0, which ksmbd already treats as no expiry.
> The response is 156 bytes again, so it works with those releases, and
> every kernel also accepts a response that sets the expiry. Use two
> __u32 halves, as the reserved area is only 4-byte aligned.
>
> Fixes: a47634cd729b ("ksmbd: expire SMB sessions when Kerberos tickets ex=
pire")
> Cc: stable@vger.kernel.org
> Closes: https://lore.kernel.org/all/CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8x=
CgtA42XUkSsAeg@mail.gmail.com/
> Assisted-by: LLM
> Signed-off-by: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
> ---
> The matching ksmbd-tools change (struct layout and mountd/worker.c)
> will follow as a pull request.
>
> Tested with a local MIT KDC and smbclient --use-kerberos=3Drequired:
>
>                     3.5.7      master     master + tools change
>   7.2               login OK   fails      login OK
>   7.3               fails      login OK   fails
>   7.3 + this patch  login OK   fails      login OK
>
> With this patch and the tools change, smbtorture smb2.session over
> Kerberos (including expire1n/1s/1e, expire2s/2e and expire_disconnect)
> and the 190 smbtorture tests run by the ksmbd CI over NTLM give the same
> results as 7.3 with ksmbd-tools master, with no kernel warnings. NTLM
> logins also work with 3.5.7. A test-only mountd that overrides the
> expiry (including values above 2^32), the response size and the length
> fields found no wrong session expiry and no kernel warnings in 313
> logins.
>
> Current ksmbd-tools master needs the tools change to work with this
> patch. If you'd rather the kernel also kept accepting the 168-byte
> layout, I can add that in a v2. Only tested with smbclient and
> smbtorture on x86_64.
>
>  fs/smb/server/auth.c          | 3 ++-
>  fs/smb/server/ksmbd_netlink.h | 5 +++--
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
> index 1b24eb3f3998..8e5a1b10db6a 100644
> --- a/fs/smb/server/auth.c
> +++ b/fs/smb/server/auth.c
> @@ -464,7 +464,8 @@ int ksmbd_krb5_authenticate(struct ksmbd_session *ses=
s, char *in_blob,
>         memcpy(out_blob, resp->payload + resp->session_key_len,
>                resp->spnego_blob_len);
>         *out_len =3D resp->spnego_blob_len;
> -       sess->kerberos_expiry =3D resp->session_expiry;
> +       sess->kerberos_expiry =3D (u64)resp->login_response.session_expir=
y_hi << 32 |
> +                               resp->login_response.session_expiry_lo;
>         retval =3D 0;
>  out:
>         kvfree_sensitive(resp, sizeof(*resp) + resp->session_key_len +
> diff --git a/fs/smb/server/ksmbd_netlink.h b/fs/smb/server/ksmbd_netlink.=
h
> index 2673522c76bc..fc6af757e45e 100644
> --- a/fs/smb/server/ksmbd_netlink.h
> +++ b/fs/smb/server/ksmbd_netlink.h
> @@ -148,7 +148,9 @@ struct ksmbd_login_response {
>         __u16   status;
>         __u16   hash_sz;                        /* hash size */
>         __s8    hash[KSMBD_REQ_MAX_HASH_SZ];    /* password hash */
> -       __u32   reserved[16];                   /* Reserved room */
> +       __u32   session_expiry_lo;      /* Kerberos ticket expiry, SPNEGO=
 only */
> +       __u32   session_expiry_hi;
> +       __u32   reserved[14];                   /* Reserved room */
>  };
>
>  /*
> @@ -286,7 +288,6 @@ struct ksmbd_spnego_authen_response {
>                                   * stored in SecurityBuffer of SMB2 SESS=
ION
>                                   * SETUP response
>                                   */
> -       __u64   session_expiry; /* Kerberos ticket expiry time */
>         __u8    payload[]; /* session key + AP_REP */
>  };
>
> --
> 2.56.0
>
