Received: from mx.manguebit.com (mx.manguebit.com [167.235.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3031B5835
	for <regressions@lists.linux.dev>; Wed, 31 Jul 2024 14:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=167.235.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722435961; cv=pass; b=mDBqF7mvIiS9X6jUlTNTeaTiMGcEnfxpQhk+NPQi4DsRCT3hFMbYQG+5dLc9VWxAbI+xTubSjQuUSm3jigyKadp5VNKnfxg+h+0RzZ5ZhU//owm4O8IcznghZAwwCMh6idafU7jJ4zp4RYHSVrZy+WpCi6cHoGT+vrw0tW5ISjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722435961; c=relaxed/simple;
	bh=PpOHKrn7anu3uWUZth3Za5PKgc3yXHTuxlL+Xie+nUc=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=nWMPzGKAi0dyD5sWjof0utHAbKvjmA58uRaO1NV/sEyUW3QgOL9aVCLCwjNVklnJSP9fOXxFKmblisJoMYzOrbpB9Usuafhvtch8flGD+JHmysFs/9+0KpRktAKUUDdlGl2qC3fpAV6QS5NtqBOqs0Iv7fssmLfLx+IutSUg1Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com; spf=pass smtp.mailfrom=manguebit.com; dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b=h3IVBL5t; arc=pass smtp.client-ip=167.235.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manguebit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manguebit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manguebit.com header.i=@manguebit.com header.b="h3IVBL5t"
Message-ID: <ff56ae33c66856c0cf21b4049dc84bcb@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722435957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWOOFfyOzuLF1ptaaYGx4J4+vorQTbpKRWpTUqYUV9Y=;
	b=h3IVBL5tFpdxzyYeG1AATBn5VLzzADlXNR94xCjxnLP7m2RTs/HgLYu/vBH7qo1i+9p6BW
	3FnLe3q7rVYQW+9qDtBVN/L92c9rdJ0U7gD12D2mcoXEqQG1RUvtMrJKSgNatidXI7jlQM
	7H3BI4HEt84tFix1RNIPyB763P9dHkxZPYaytc2m5adwOXGq/t10NQTPtlEUHWlQmJcUtu
	I0k26Dni69JSChw7Ogaz+F62G2ltYkIZoPUzouhHqLvNoAq+oCnWsTc1tsMOzNR0XlCqNU
	Q0EDRT9ywvtvY9D4BGLQnC2C/sfhx1JsvUzSaKPUJhfo+jMZH2U+4hccPSPQzA==
ARC-Seal: i=1; s=dkim; d=manguebit.com; t=1722435957; a=rsa-sha256;
	cv=none;
	b=kH6HOQ/paxYz8/MY5ddvoY+MIh6dbspTE3nIgbWXQGu2mh6OHFLPOoj3yJLQVW/QJUVwcw
	1vBXN5qmfi68GqI38k1vZgsFU3Fz2WzWWOZVEIZBrHSNgJL5W4H2DhobjKZpUUZD2K/Q6g
	x8fSW31W/UHVfmGcLXCNtQnsCl/NXatO2LkW2Z71CLQd7zzDiGL5QGrFsoYn7xDG/N2Puh
	SgYjQqpA3pc6cD7e4B0Rf68otiP4NFq3DBXX+ATD3lY52zHqM2b6y3NbVN2teuFQbKlbTc
	geeHid3a6qQEkC7NIKBseG/lSZ5HKQhDsHqL95LNjkVfM/5N8E0k2qdSp8Ph8Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.mailfrom=pc@manguebit.com
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
	s=dkim; t=1722435957; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TWOOFfyOzuLF1ptaaYGx4J4+vorQTbpKRWpTUqYUV9Y=;
	b=FgS2jMn/a4Tl6ipmbVxFlOJPw0xjR+g4Jzs/jUmHWY9PCWk65OOrYs+l4E4lA8JdZhBqPl
	h+3gvb7VVrTEH3uoXf0kowsKjveVi9mDXhCnj/iRaCFJOCHPe0y+oEJw1eyzISLfwaKEMy
	IBBFqQy/3/5bSTwmI0It/4xtjhkpZjsUwo0erEXaNr1GWc1ceiJlI24yis1tXoDiqAky76
	JnYsD8/4vz71kzCZXC1+RWr+QdiRPzGd26awDl71EBYEEwVZHliK+ExkCKSSBimyJu39FG
	DvLecKiRjHfNan4IeGKPy368Wqrh51wbRKA2cgkZor6Op7xkQ+fOpm9J2qsSRQ==
From: Paulo Alcantara <pc@manguebit.com>
To: =?utf-8?Q?Steinbei=C3=9Fer=2C_Sebastian?=
 <Sebastian.Steinbeisser@lrz.de>,
 "tom@talpey.com" <tom@talpey.com>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>
Cc: "smfrench@gmail.com" <smfrench@gmail.com>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
In-Reply-To: <ff47edb26e0cd9e591cfb3ece2407971202dfc09.camel@lrz.de>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
 <f3a02647b6fcb27a70da4c334930ad3c@manguebit.com>
 <9654b28ff276b5b78ffcc3078bd4dd1ccf80ec73.camel@lrz.de>
 <5210f9e7b720dc1d150bd2ebd9f4edadf39685aa.camel@lrz.de>
 <0ff960c2bde0f213cc9b7ef98b993bfb@manguebit.com>
 <dd0259752e3557fa1b60dda4db3bf790d9ff877c.camel@lrz.de>
 <4b718a0b9a967d4bc0428a3f706e3b15@manguebit.com>
 <98d458ba-4258-4598-b8fc-0fe6cfeb2f87@talpey.com>
 <2849de0676a015619b922708005a243595f9f56b.camel@lrz.de>
 <6db3dbb8a7a6f4f5ed0f63d0e0c784c7@manguebit.com>
 <8bf2462eb9aa4d30b866da57720a36c90c0a43df.camel@lrz.de>
 <d208a9307b32ccf4d3fd7b08c6b95445@manguebit.com>
 <aed542086314197bcec6a50c7d6ee76cb6e65f96.camel@lrz.de>
 <ac58f36e10af65cd672fba66e99faa2c@manguebit.com>
 <1359665240338585cfbc4eac58339ab1d0423788.camel@lrz.de>
 <ff47edb26e0cd9e591cfb3ece2407971202dfc09.camel@lrz.de>
Date: Wed, 31 Jul 2024 11:25:53 -0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Steinbei=C3=9Fer, Sebastian	<Sebastian.Steinbeisser@lrz.de> writes:

> one thing I should have tested but forgot and now did:
> With the patch applied it is also possible to mount one of the SMB 3.1
> signed & encrypted shares that were originally affected on the
> production system and not only the test one!

Thank you very much for testing it!  The fix was sent upstream already.

BTW, I've noticed that the previous network trace showed that the
FSCTL_GET_REPARSE_POINT in the compounded response returned
STATUS_SUCCESS rather than STATUS_INVALID_DEVICE_REQUEST.  So I compared
it with other network traces and it seems that NetApp server is
requiring the client to open the file with FILE_READ_EA bit set in
SMB2_CREATE::AccessMask.  Windows client also sets FILE_READ_EA it, so
the FSCTL_GET_REPARSE_POINT request would probably work against NetApp
server.

I don't see anything in the specs that would require FILE_READ_EA being
set for FSCTL_GET_REPARSE_POINT, but could you please do another testing
with below changes on top of existing patch just to confirm my findings?

Thanks.

diff --git a/fs/smb/client/smb2inode.c b/fs/smb/client/smb2inode.c
index 062b86a4936f..e241a966997e 100644
--- a/fs/smb/client/smb2inode.c
+++ b/fs/smb/client/smb2inode.c
@@ -1258,7 +1258,8 @@ int smb2_query_reparse_point(const unsigned int xid,
 	cifs_dbg(FYI, "%s: path: %s\n", __func__, full_path);
=20
 	cifs_get_readable_path(tcon, full_path, &cfile);
-	oparms =3D CIFS_OPARMS(cifs_sb, tcon, full_path, FILE_READ_ATTRIBUTES,
+	oparms =3D CIFS_OPARMS(cifs_sb, tcon, full_path,
+			     FILE_READ_EA | FILE_READ_ATTRIBUTES | SYNCHRONIZE,
 			     FILE_OPEN, OPEN_REPARSE_POINT, ACL_NO_MODE);
 	rc =3D smb2_compound_op(xid, tcon, cifs_sb,
 			      full_path, &oparms, &in_iov,
