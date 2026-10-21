Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792546297;
	b=5EXotnvHc4JssSCsmLqS7wKm9bxMB3svQTxgDSIG/a+XCB/bO/1xUBVDflVotU06wesS
	 WRU1SiSSDgnSWZk/mq4/517Lti0yA5+hYC+Oaf5xNcLarn2/IjtCO5uxK2VVBciIDOBrJ
	 2Ru+dtfvsQozwiuFjv4wedph2HVRrlUFgqMlK4wjogvINaPwke7txXpQfKFFJ1ViNbWXb
	 eIsdS45UEDYKLB1b99IuDH+pzzTVcTSDP9QxxjlKsmwdX/TM/JixElKUYIzM+4qq00CnB
	 2mepkNKMYxkqlhMjjYPtag8lVFrwi9syb+wZj7FgC+kkK4EbGkmmHasvv2nTjdLhahw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546297;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bTpr9NpTetHnln92kjh8Q6soXs5SB2dE5Ll01BYhvvE=;
	b=EKbQCN3hfavbwk+Fy+U0VS/usmIu70Dcncb2q/zVkYK3DeVPoH6T0iZm6R8O3Wjt31B+
	 dlSvy02UgssTh8I+aBm7S4tnKjM/KC5GK4XBFZOoZ3pROMObP/zHys1X2xVTrdcaPjEN2
	 iDco+VSguUcDYfoBL2NMPFvZqzzia0G5pj7CsYAM2EqsIWgo6E5E1czVtAgu0I5gThQWa
	 8MGzkJpfGpR7xrSvP4s5qh9dy/W4/MDC6w/73MdtjjrSJv02o/IrJ7EuoiTclgThFQMdg
	 fD1OE+esMtSZCF2C98uQEYycsNJrLTxONpITt6TptTk/mzaikTRpmSVPPvXqF1Jvweg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bbKICx/K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA35606A320
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 01:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bbKICx/K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8C41F000CF
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 01:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792546297;
	bh=bTpr9NpTetHnln92kjh8Q6soXs5SB2dE5Ll01BYhvvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bbKICx/KK3P3wZ0KKBlnK5u7NjkUvqFMJpXNBRYU+j72o5FS8tfeis4KXE8YyU5UX
	 +2SSTJuaU+zWA/I/DZcYJFu6Y/UDnnHwwO5v61OvXx+sdv2c3FEvGRbyT1/43euMP1
	 69KMubu0kd4VKs5+2HNvDgBfxKFeL5iU5h7ZI5fxn3oqN1YjEcC6FVKsmlxJgOG1lN
	 VGQpoDaaXKrvCHk7as1jMQUt7X+wPNT09KM06itolmhH02Vdubk2OSLMPYz4wDxaQQ
	 ji1Irg+sM99bJgTQksYe8jRBWUd+ptuakW3CEwWrVWAqX2JqeXjsUObNDW0UpVTnB+
	 H/E3Gfy/QdTsg==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2a4e013a44so16315966b.2
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 18:31:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBP0pPLkTsm5UJJR6ZvtmnUR2Lv1kviN8bv59PuV9VftXv1a7qjSGsVx9YrGprclhbpB/dsxqkwn/r5A==@lists.linux.dev
X-Gm-Message-State: AFq9FYIlzmU0sZa1tr07JE44C+laTansWpcYXx2ki5dHFD6ZTz+kpEOn
	pzvcVq/Lx2TmBU/rs+v0MMBr8weYe8vzrY6jIl7HsJ47d5f748dwA8093ZvUetgdHx7YkVeP6Oc
	1hXYrWiPWsMphTjOZ7LjsUugoIknRdSk=
X-Received: by 2002:a17:907:3f98:b0:c46:75e7:25af with SMTP id
 a640c23a62f3a-c46796669c8mr53247766b.11.1792546295786; Tue, 20 Oct 2026
 18:31:35 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8xCgtA42XUkSsAeg@mail.gmail.com>
In-Reply-To: <CAO+rqLhpPvY0NLrAnZjFXz0gOXnA6zsXxK8xCgtA42XUkSsAeg@mail.gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 21 Oct 2026 10:31:23 +0900
X-Gmail-Original-Message-ID: <CAKYAXd9Otv_doQutE+gzKJ+Pp9Wi5mjCZpFdfobGJER5=hM4JA@mail.gmail.com>
X-Gm-Features: AclHuK8fkB3qvtBt_Moreu2LAmL8ZAC9wrTcuR5XTcDmGloZjIbZ6yJjmLOhILo
Message-ID: <CAKYAXd9Otv_doQutE+gzKJ+Pp9Wi5mjCZpFdfobGJER5=hM4JA@mail.gmail.com>
Subject: Re: ksmbd: Kerberos login fails on 7.3 with released ksmbd-tools
To: mixalhs <mike.michalo@gmail.com>
Cc: linux-cifs@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 9:39=E2=80=AFAM mixalhs <mike.michalo@gmail.com> wr=
ote:
>
> Hi Namjae,
>
> Kerberos session setup fails on 7.3 with the latest released
> ksmbd-tools (3.5.7), and ksmbd-tools master fails the same way on 7.2.
>
> struct ksmbd_spnego_authen_response gained a __u64 session_expiry field
> before payload[] in 7.3 (commit a47634cd729b, not in 7.2), making it
> 168 bytes; in ksmbd-tools 3.5.7 it is still 156 bytes.  ksmbd-tools
> only gained the field on master on Oct 18 (4c0ca83), after 3.5.7, and
> always sends the new layout.  ipc_validate_msg() requires
> msg_sz =3D=3D sizeof(*resp) + session_key_len + spnego_blob_len, so any
> mismatch is dropped.
>
> Tested with a local MIT KDC and smbclient --use-kerberos=3Drequired, same
> realm and user throughout:
>
>                     ksmbd-tools 3.5.7    ksmbd-tools master
>   7.2 (mainline)    login OK             NT_STATUS_INVALID_PARAMETER
>   7.3 (ksmbd-next)  NT_STATUS_LOGON_FAILURE   login OK
>
> In both failing cases ksmbd.mountd logs "Authenticated user `testuser'"
> and the kernel logs "SPNEGO_AUTHEN_REQUEST failure".  NTLM logins are
> not affected.
>
> From the code, 6.6.y, 6.12.y and 6.18.y also require the old 156-byte
> size, so a ksmbd-tools release built from master would break Kerberos
> there as well (only 7.2 tested).
>
> Would you like the kernel to accept the old response size again, with
> ksmbd-tools sending the new layout only to kernels that support it?
> I'd be more tan happy to write and test the kernel side. :)
Thanks for the report and testing. The approach sounds good. Please
send the patch for this issue. Could you also update ksmbd-tools ?
Thanks!
