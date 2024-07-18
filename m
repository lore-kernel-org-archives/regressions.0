Received: from smtp-outbound4.duck.com (smtp-outbound4.duck.com [20.67.222.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE6B1B86FB
	for <regressions@lists.linux.dev>; Thu, 18 Jul 2024 04:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=20.67.222.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721277539; cv=none; b=Gfq7fzMRH/cMkFCX+mZXP8tPt7WdALdo2kKraTQDuAi2S47YkcXbJWo7gRYWAL7XVKNgwzO4LWQ0gtqj5Gvdohybz7Kw9E7lJ9M7jq25U7hfqC3ov0E9oMPWQQ6kPLFBeHnRVHeOYr8AdU08mHbxz70rTTSrxzQg2FRR3r7i9LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721277539; c=relaxed/simple;
	bh=uGmYkX/il414SzMLrlXQtLMd5aniBrjc2NutAo9I05s=;
	h=References:Subject:MIME-Version:Content-Type:To:Cc:Message-ID:
	 Date:From; b=G7AhGnye+C1oIBN3Gr9ft2IC0e7QtKBbzbuATueE+W3NHrx9jfrnpmeJ6cRnoep1/Ee7cbCZxUpCKf1ai8T1+/Ymgl3uo5HIWWz4oYihFqgsX4hLbfze+BvMeeiepIACSQnbMjyn3dGIdE0n9mcQEGpg8GG77qhWGsZfyAEM+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=duck.com; spf=pass smtp.mailfrom=duck.com; dkim=pass (1024-bit key) header.d=duck.com header.i=@duck.com header.b=QT24PT/Q; arc=none smtp.client-ip=20.67.222.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=duck.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duck.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duck.com header.i=@duck.com header.b="QT24PT/Q"
References: <1a61d10f-7974-4fb5-ada6-f2c40c55f2f7@leemhuis.info> <20240715100424.GA18686@willie-the-truck> <1a61d10f-7974-4fb5-ada6-f2c40c55f2f7@leemhuis.info> <37EBD2B9-3314-4F42-8DDB-5D08242959E0.1@smtp-inbound1.duck.com>
Subject: Re: Boot error since 6.9: Initramfs unpacking failed: invalid magic
 at start of compressed archive
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Bar: +++++++
X-Rspamd-Report: DMARC_POLICY_ALLOW(-0.5) SPOOF_DISPLAY_NAME(8) R_DKIM_ALLOW(-0.2) MIME_GOOD(-0.1) R_SPF_ALLOW(-0.2)
X-Rspamd-Score: 7
X-Rspamd-Action: add header
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Jack D <wm2vdghq@duck.com>
Received: by smtp-inbound1.duck.com; Thu, 18 Jul 2024 00:38:56 -0400
Message-ID: <2440170F-4F1B-42E2-8DED-BED5D92D32C8.1@smtp-inbound1.duck.com>
Date: Thu, 18 Jul 2024 00:38:56 -0400
From: wm2vdghq@duck.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duck.com; h=From:
 Date: Message-ID: Cc: To: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Subject: References; q=dns/txt; s=postal-KpyQVw;
 t=1721277536; bh=uGmYkX/il414SzMLrlXQtLMd5aniBrjc2NutAo9I05s=;
 b=QT24PT/QQD8i+w2ZxaYpxD7TiNtboEpKeBq1CuPlsCWPR4hBsvaargZUOGCIN7JKfWfWt/GnP
 STfJWzxsnjmdBXk9TEy5a7ntn2N2l0k8KgKyL/j1QGo7lhMxgISpLh+///SVCmVxk8x3tI99Oq6
 P0vKV66FD4agsNwwgm5eZBE=

On Monday, July 15, 2024 at 03:04:34 AM PDT, Will Deacon wrote:
> On Mon, Jul 15, 2024 at 08:24:04AM +0200, Thorsten Leemhuis wrote:
> quote from https://bugzilla.kernel.org/show_bug.cgi?id=3D219014 :
> >=20
> > I'm marking as arm64 since git bisect identifies the first problematic =
commit as:
> >=C2=A0 6d75c6f40a03c97e1ecd683ae54e249abb9d922b
> >=20
> > git bisect log is attached.
> >=20
> > Any kernel tagged v6.9x and later fails to boot with the following =
error:
> >=20
> > [=C2=A0 =C2=A0 0.420154] Initramfs unpacking failed: invalid magic at =
start of compressed archive

> My guess (based on times I've seen this sort of thing in the past) is
> that the kernel binary grew in size and the broken bootloader is loading
> the kernel over the initramfs instead of parsing the 'image_size' field
> in the boot header.

(I hope I got the email formatting for this list correct. Apologies if I =
messed it up.)

Yes, that was it. Thank you for your quick (and accurate) assessment. The =
commit
increased my uncompressed kernel by ~1MB. Not much, but enough to cause an
address conflict.

