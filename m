Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792543194;
	b=MZGNhciub2xA7HbGzcWAjmPaDDhdbyVE7oDa05pHrUnN0q2nOyb/plnpCQADbAFntzTR
	 S9rz7+zDMVvoiQ/RKux/Vtw2QALIkJZZQiKYcq6ds9IDn2ULSYAkodzqVVQJ6iJfCm8zs
	 fAv0KjGF5gul0Krq+JPz1pwFvIwmgzvQOYYeQ9wQevgZ67ET0n+mXUYmpfnGi/ErlNHIk
	 6PKznRosdzKBpPzW6+/TvBh7SwLram4fL3rwG/OgXQNd0bX0WbyBPlDoL7yWSZiTyXiLT
	 10F+pSGKyuAQXnqXJ1K0xDlqaMprRVP7DtkuiRPYI4HHAf40CDIpV4sx/Tnz/M3S4eA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=yRIGCmBCLZXrskue80uJ2gMa4RxJkt2FFdVYi0NxvFw=;
	b=bRlzvbqxxbOxK7bMdQzWik7/zJYZu1Mx1Xt5ASMOb9bfQC2WOJF09v8RKLBa0f7++GcE
	 4WdIzzgz9TBo9MaVfEWeE3gzXOz612ChT6cIh/erDW42SIFb8vjkmodUl8VvB4Oh0fvEv
	 Y9AMXOZH88oU5itcLLwn04M9PofJ5HA9eyhTmL8oENe+H0qJCEEx/xka5do2maurxO8Sn
	 5c2QMVUdpheEHB1r02MHT4P09gOEbwFqHWDlDLIFLtv8dM8ufIsrT1cPI3D5g+wuEpOh0
	 H5GPTJ86gajRAUxTSnrmUcVf0D/1m7P0M3Pq3g4/9dzWebSFOGkHo3H7RL5A10zPEJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Y2BKsS/o";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F95606A31D
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 00:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F95606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y2BKsS/o
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e948e56af3so43845e0c.2
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 17:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792543193; cv=none;
        d=google.com; s=arc-20260327;
        b=mTch5V/z7MQxdcmuZg8BHBq0zxBtwjxOUCpWVtYG4h0UaJVuY1ESV+QpA5M+pFgm0s
         LUC237Vb/mxi3tEvAce3rz42Sq0C74IEM2TZ2ZOsjqod1N2x3vY0F4ddR3mrusl6gly2
         Wc5uoxmgAvKGLhYqHZeCu48Z5MTEJUAhwnM+s0xfpieG8hQtxBfsBIhn8kSvCvNhWIH0
         WFobrsATwPiXEzN4MNNFXNu+KXmedTQfez6qTB9YVOKDVd6Uw0dI4R9/EK4YotRc6wor
         KebxwHaIXlhHU5CISjN+vHM9Do6LOf6tYcgQIUBce8gBFnmwoWg8u/HSDdhlyIryWoTI
         AtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yRIGCmBCLZXrskue80uJ2gMa4RxJkt2FFdVYi0NxvFw=;
        fh=LA71vZ9GIgEPALIdbetHot/PlUQj8Efbmt/r4GGZl1k=;
        b=o4yMpjZAHPp6aIqJbi0FxM2APiMKJDbXQWoqGtZpM70bDO4EPzuZC+3Z7y2hgoE+f+
         nyKNt2gI6+clnYiB5yrKr/HduC4OizhN/33nipI7oWka/dJfRgu0Pm5L82sp8sIGVXbj
         rpw5eX6o3vcw7V6SNs5r7YbvgraGM4Qa0MyrQlrawusvoAfuMD6lRMlnONrwKqoL1726
         Sp2CkOIfAhO69qFxW1RxG+bLgk3AT26aJ11g2EIHyflMP+Efwjm39tab1pS/19RMvO1F
         IgTvya/9zyUHBnuvwT6EFtew8bP2hK/M3e1jiACT/LdtHAu82eSMfJ1AKFVS3wFqHu9N
         f+Dw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792543193; x=1793147993; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yRIGCmBCLZXrskue80uJ2gMa4RxJkt2FFdVYi0NxvFw=;
        b=Y2BKsS/oqoF/j6XXKv6dN2oV4cDgp0XMAKfUkHvKl/e3yjGeNn8SiADAx8hc7chNWy
         f2iQP19jt7iaynHeW+N4OAjiw0nV2IAJ5N28uBa7SY39Wb2HIT8QkFbVmzJKDtVd/HzX
         2BjZFZQY2wtlQ8c6F5M5E/UP5HjtePmHXrZJwLIMFs6OGHRuMj16TcPsoDH871MALPTB
         WdvJB5LtDrHDdJoXrbP0o0f/wOAuFJm5su9tTplU232zbRThzGXpZaFN4RveLVs8u5nI
         hVQz5ir8HkId52N0t1op7eaweHQ84HGMbzR7GpiDxtEl5g/YhiNq6znAVPAWNDdx6V9s
         2d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792543193; x=1793147993;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yRIGCmBCLZXrskue80uJ2gMa4RxJkt2FFdVYi0NxvFw=;
        b=Cx16G+Nl1WaefQAGqfbD9JEFcfXlkYyDxFY1PUSHF9byEeQHkRUYENdqgJ3ykF2qKY
         fwiSKEWsyB/nzDHpxNOW3rl0Wt3gnQJRj3AC6KTMR1zJrJSukPD7jS3ZoD5rWL2xL7Im
         b2xe2fmR5IdaEcd1Yxkm68D+ngn1bDkMfb+H0VeIoxLiq7gOSdXXwxlY7ZL3Bspr4qqJ
         yPUFj6yFO5rIkbiSbf0gdPyeG3XVh1C9K4kfiRHjCb2dRFCnNAwDhgz2lp3aMltRq2Yx
         DUr6F2FCciGjd5LEW6wrWPVVQMoJKOhLvPkW64Dp/t9mnLGPb6jAYeyOKi+o2OSovmrX
         +Y2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxxIzroPE1zWxPL+RvlSz/rKjkYJHrLnc4LZF3KE83xL8oenghkxc2jD+b5K3HNculBqGIeiIIihvQBzQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIZYL+qK+lkG6tBTV/33kvR2mww1A91exQ7NH4NdV34IrHYhHWi
	6+5OB7ApjVY53zXEjE0CZXV+HQXSxGySYsDvhtZfBh2Vp7BJUaZtsMeX6KjcDLNOBOU4xiZEOz8
	IsMH6uqUZWi1uW3Umkl6jlkJ8ml8V9a4=
X-Gm-Gg: AYBFou3oyK+MdJiFCx2H4nJc2EI/SEdnEjd+trAAN+aMgLLHY8uFFut4tVSq+Pm+QZ+
	5eqFoxKrmr/oFES236NEilEenlqbjx6psHEoDO8wfF7t9HAeHdjmsRjANpZc6PoJ9xzM7ghmQbT
	yktgPIOH0rROzPOoMgHD05u04Uiny0taGnP4uZs4rpSfSN8XnXDvVFwYimVRSaQgwmqbJO0Mzxs
	MzasWDASzxvM2VTAXAaXm4AS9daRQw5rKkqA6XP+0tHbHy/ZDxNBMuIbQLyvwLYsDiQoQ7eAVO2
	I4Jx2FMk77G8O82vjtcS41mlCyE0RX8TSdgq9DwcMiYAPFH8DQ6630epHVfiWAix4YnhvPZHbHG
	6PNIl0GvX5w==
X-Received: by 2002:a05:6122:5316:b0:5ea:b9b5:8c43 with SMTP id
 71dfb90a1353d-5eaebe0552dmr193146e0c.18.1792543193001; Tue, 20 Oct 2026
 17:39:53 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: mixalhs <mike.michalo@gmail.com>
Date: Wed, 21 Oct 2026 02:39:39 +0200
X-Gm-Features: AclHuK-p-6jHmmFtAn8ZlfPP0jgzDBc8fS7hal7SGHDBcgq1FOZA-oWjl887KHk
Message-ID: <CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8xCgtA42XUkSsAeg@mail.gmail.com>
Subject: ksmbd: Kerberos login fails on 7.3 with released ksmbd-tools
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Namjae,

Kerberos session setup fails on 7.3 with the latest released
ksmbd-tools (3.5.7), and ksmbd-tools master fails the same way on 7.2.

struct ksmbd_spnego_authen_response gained a __u64 session_expiry field
before payload[] in 7.3 (commit a47634cd729b, not in 7.2), making it
168 bytes; in ksmbd-tools 3.5.7 it is still 156 bytes.  ksmbd-tools
only gained the field on master on Oct 18 (4c0ca83), after 3.5.7, and
always sends the new layout.  ipc_validate_msg() requires
msg_sz == sizeof(*resp) + session_key_len + spnego_blob_len, so any
mismatch is dropped.

Tested with a local MIT KDC and smbclient --use-kerberos=required, same
realm and user throughout:

                    ksmbd-tools 3.5.7    ksmbd-tools master
  7.2 (mainline)    login OK             NT_STATUS_INVALID_PARAMETER
  7.3 (ksmbd-next)  NT_STATUS_LOGON_FAILURE   login OK

In both failing cases ksmbd.mountd logs "Authenticated user `testuser'"
and the kernel logs "SPNEGO_AUTHEN_REQUEST failure".  NTLM logins are
not affected.

From the code, 6.6.y, 6.12.y and 6.18.y also require the old 156-byte
size, so a ksmbd-tools release built from master would break Kerberos
there as well (only 7.2 tested).

Would you like the kernel to accept the old response size again, with
ksmbd-tools sending the new layout only to kernels that support it?
I'd be more tan happy to write and test the kernel side. :)

Thanks,
Michalis
