Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3439E6C8
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 14:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771942062; cv=none; b=l35WxXg7lrM6CyhIvvPbqdu//OZDXSt3AfGS3uZkYlvpM/j1mkUr4gjM9BjHor5MYdizfYA0xaJ/XTH5vVJC0ps86FEREcIGDTg+eydP8So9hzPxXQ+M71uzUH/NJmLeWz7PXIAwnOql2ZgqI6O/CKbGmVdSDN/KwlXwPLkKndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771942062; c=relaxed/simple;
	bh=zvsTHCS8+4y5hveZ1Lp+yYU6DJyRdxswThUMqjj6iww=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TXEctv1ukaXYwBQpbZxP8RAv3Ox3LSaU6iyGMYmp6huFhnNLfV3hYktFRCur7NpiBNl+IWEYXdETjue/c88Q56yqX3A4T+ZICcnqN8M5etmMzyOkD3LVqJmMQ0OTa+TgYRtnIufabNK3I6DSV2pB3MTgojZRsfSsZ/12qEfq7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=b1gcEi86; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="b1gcEi86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1771942054; x=1772201254;
	bh=zvsTHCS8+4y5hveZ1Lp+yYU6DJyRdxswThUMqjj6iww=;
	h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b1gcEi86ICMsYT0/H8XLS+WAFDHab6oOgpwwS4Wj8gNFCvDc7RsuUPLXZRf+ADQMr
	 56cIMfKB1CuOF6XlUx4aeWEoF8XR/sGyKLDjHLshWggE+o3veWsX1St/0/JNjxDwFC
	 WtA4JKfOyb2RPRATs96Fq3O+hRqNbIJFw9Qr+vUObr5q7yN+pes/uWVlpfTZnGA9rt
	 7euDzeoPPkVx9FuP8zRHq/rmS5ttXoPCudhSiBoLbeZMX5N/e9tzVq+z3tGMe54Fgo
	 4UUWMe5zP/NLvO/9lRxhBjYh6fwK5GqX+QMlb4BXshgubxUyewkG5LgcOqLf37XG4i
	 6IrUDGI93iMlg==
Date: Tue, 24 Feb 2026 14:07:32 +0000
To: regressions@lists.linux.dev
From: Tj <tj.iam.tj@proton.me>
Subject: Fwd: Regression: Missing check in nfsd_permission() causes -ENOLCK No locks available
Message-ID: <b7dbdf5e-857a-4370-8144-dd8d6355e71a@proton.me>
In-Reply-To: <c0f15088-3fc0-487a-9f24-cf89c158420d@proton.me>
References: <c0f15088-3fc0-487a-9f24-cf89c158420d@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 2daf01f323a0633bfb6d1ca93232c8e95f7a5f9e
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Previously reported at:

https://lore.kernel.org/linux-nfs/c0f15088-3fc0-487a-9f24-cf89c158420d@prot=
on.me/T/#u

Upstream commit 4cc9b9f2bf4dfe13fe573 "nfsd: refine and rename=20
NFSD_MAY_LOCK" and
 =C2=A0stable v6.12.54 commit 18744bc56b0ec=C2=A0 (re)moves checks from=20
fs/nfsd/vfs.c::nfsd_permission().

 =C2=A0This causes NFS clients to see

$ flock -e -w 4 /srv/NAS/test/debian-13.3.0-amd64-netinst.iso sleep 1
flock: /srv/NAS/test/debian-13.3.0-amd64-netinst.iso: No locks available

Keeping the check in nfsd_permission() whilst also copying it to=20
fs/nfsd/nfsfh.c::__fh_verify() resolves the issue.

This was discovered on the Debian openQA infrastructure server when=20
upgrading kernel from v6.12.48 to later v6.12.y where worker hosts (with=20
any earlier or later kernel version) pass NFSv3 mounted ISO images to=20
qemu-system-x86_64 and it reports:

!!! : qemu-system-x86_64: -device=20
scsi-cd,id=3Dcd0-device,drive=3Dcd0-overlay0,serial=3Dcd0: Failed to get=20
"consistent read" lock: No locks available
QEMU: Is another process using the image=20
[/var/lib/openqa/pool/2/20260223-1-debian-testing-amd64-netinst.iso]?

A simple reproducer with the server using:

# cat /etc/exports.d/test.exports
/srv/NAS/test=20
fdff::/64(fsid=3D0,rw,no_root_squash,sync,no_subtree_check,auth_nlm)

and clients using:

# mount -t nfs [fdff::2]:/srv/NAS/test /srv/NAS/test -o=20
proto=3Dtcp6,ro,fsc,soft

will trigger the error as shown above:

$ flock -e -w 4 /srv/NAS/test/debian-13.3.0-amd64-netinst.iso sleep 1
flock: /srv/NAS/test/debian-13.3.0-amd64-netinst.iso: No locks available

A simple test program calling fcntl() with the same arguments QEMU uses=20
also fails in the same way.

$ ./nfs3_range_lock_test=20
/srv/NAS/test/debian-13.3.0-amd64-netinst.{iso,overlay}
Opened base file: /srv/NAS/test/debian-13.3.0-amd64-netinst.iso
Opened overlay file: /srv/NAS/test/debian-13.3.0-amd64-netinst.overlay
Attempting lock at 4 on /srv/NAS/test/debian-13.3.0-amd64-netinst.iso
fcntl(fd, F_GETLK, &fl) failed on base: No locks available
Attempting lock at 8 on /srv/NAS/test/debian-13.3.0-amd64-netinst.overlay
fcntl(fd, F_GETLK, &fl) failed on overlay: No locks available


