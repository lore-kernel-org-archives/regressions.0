Received: from va-2-59.ptr.blmpb.com (va-2-59.ptr.blmpb.com [209.127.231.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38340282F17
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 03:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787714891; cv=none; b=O32RPNpK/HpYR0JHqmjUMw58eBZy18oqBi8cxzn/HkFDanMaMq9wPKlc0oTWugDJUxuGumyUIuLxDOK7C30Gx+kIj44daPF4W1jXvomOXHWKxF28i/Or4W5+gbwutuao1BBpRVOPNbxj1z3aEQggYZvPC4WjS4VY8V21uuaNo30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787714891; c=relaxed/simple;
	bh=Ni6nWHI31WtpOQoExFANzhRemSs49gciRDspmHNTIUg=;
	h=To:Date:Content-Type:References:From:Subject:Message-Id:
	 In-Reply-To:Cc:Mime-Version; b=EGBpM5cGbvlerebW9l3kBATzy/kux/GHehxpcdNTvhMUR0TfjO+qfd4YzF+zbu5LQdeGjsfWLpdwk0421yj/SYk2WnH5g1AxOkIAg+tUsCNWQTSFdTKEQtPr1dDjwhQYisvouLTqzniUtGPu9gh1h57UaBtSKLM82RMx86/Y+jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=hEdtcoNP; arc=none smtp.client-ip=209.127.231.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="hEdtcoNP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1787714872;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=6o/BpOlg6+8SCmrSwVSWWUYvT1yB0r+7VJMt5sPD9As=;
 b=hEdtcoNPGOiE4HMAOOZ8u2t8WlChHcPdir3hbLcc66IH1NZ2pPLuP8RPvBIrNNy+yl63Uj
 5Za8pdpd1/8IMcGLEFTe7kV0t0ZNPCXfTnxm3FNsWdJXMw3AqIMXsIlkoS9CK/RgRYt7Vt
 uOg78RTM8I1L4UCETTGNRo5qWouak7g5jJ2SvMc2OFWj2FRYiNgleylntHWFf8gx3p7msO
 3NU9VkvH038FIv/hZwbYVNgIKnmLe/gGQlzQ4P+aA5xVdS5AQ31QkCXp/WSSCSIB2aanWb
 WErju6z0WtAPJcTe11yhwdE3GhXYjJCFsIM7PM30Nml9pVAUr3WBtVquItnrjQ==
To: "Pim Zandbergen" <pim@zandbergen.org>, <linux-raid@vger.kernel.org>, 
	"yu kuai" <yukuai@fygo.io>
Date: Wed, 26 Aug 2026 11:27:47 +0800
Content-Type: text/plain; charset=UTF-8
X-Original-From: yu kuai <yukuai@fygo.io>
Content-Transfer-Encoding: quoted-printable
References: <20260825T171428.247977.raid5-discard-reshape@zandbergen.org>
Reply-To: yukuai@fygo.io
From: "yu kuai" <yukuai@fygo.io>
Subject: Re: [REGRESSION] md/raid5: discard submitted during reshape is never completed, submitter hangs in D state forever
Message-Id: <4b1f026d-ac9c-4594-9578-accdf3d727a0@fygo.io>
Received: from [192.168.1.104] ([39.182.0.185]) by smtp.larksuite.com with ESMTPS; Wed, 26 Aug 2026 03:27:51 +0000
In-Reply-To: <20260825T171428.247977.raid5-discard-reshape@zandbergen.org>
X-Lms-Return-Path: <lba+26a8e5d37+f30634+lists.linux.dev+yukuai@fygo.io>
Cc: <song@kernel.org>, <magiclinan@didiglobal.com>, <xiao@kernel.org>, 
	<regressions@lists.linux.dev>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird

Hi,

=E5=9C=A8 2026/8/26 1:14, Pim Zandbergen =E5=86=99=E9=81=93:
> Hi,
>
> Since commit 90573092673c ("md/raid5: validate discard support at
> request time", v7.2-rc1), a discard bio submitted to a raid5/raid6
> array while a reshape is running is dropped without ever being
> completed. The submitting task hangs in uninterruptible sleep
> indefinitely, and only a reboot clears it. On my machine this turned
> the weekly systemd fstrim.timer run into a day-long filesystem-wide
> stall that ended in a hard reset.

Already fixed by:

[PATCH] md/raid5: complete discard bios while reshape is active -=20
Genjian=20
<https://lore.kernel.org/all/20260711161326.962336-1-zhanggenjian@126.com/>

>
> Mechanism
> ---------
>
> Before 90573092673c, an array whose members do not support discard
> (or without devices_handle_discard_safely set) advertised
> max_hw_discard_sectors =3D 0, so FITRIM and blkdev discards never
> reached raid5 at all. Since that commit the array always advertises
> UINT_MAX and member support is validated at request time in
> raid5_discard_limits(), which correctly completes unsupported bios
> with BLK_STS_NOTSUPP and bio_endio().
>
> However, make_discard_request() still contains the reshape guard
> that predates request-time validation (620125f2bf8f, "MD: raid5
> trim support", v3.7):
>
> 	if (mddev->reshape_position !=3D MaxSector)
> 		/* Skip discard while reshape is happening */
> 		return;
>
> (drivers/md/raid5.c:5726 in v7.2, still present in current master.)
>
> This returns without calling bio_endio(). The caller treats the bio
> as handled:
>
> 	if (unlikely(bio_op(bi) =3D=3D REQ_OP_DISCARD)) {
> 		make_discard_request(mddev, bi);
> 		md_write_end(mddev);
> 		return true;
> 	}
>
> so nothing ever completes the bio. blkdev_issue_discard() waits in
> submit_bio_wait() forever and the submitter is stuck in D state.
> Nothing re-queues the bio when the reshape finishes, so reshape
> completion does not recover it.
>
> Note that the reshape check runs before raid5_discard_limits(), so
> this hits any raid5/6 array under reshape, including arrays whose
> members have no discard support at all and which would otherwise be
> correctly rejected with BLK_STS_NOTSUPP. That is exactly my case:
> before v7.2 the same fstrim run was a silently skipped no-op for
> years; the kernel upgrade made it reachable, and the first time it
> fired during a reshape it wedged the machine.
>
> Real-world impact observed
> --------------------------
>
> Timeline on the affected machine (arm64, v7.2, raid6 of 10 SATA
> HDDs, at the time mid-grow from 8 to 10 members, XFS on LVM on top):
>
> - Fri 19:59: mdadm grow/reshape starts.
> - Mon 00:40: weekly fstrim.timer fires. fstrim reaches the XFS
>    filesystems on the array and hangs in D state on the first
>    discard. It stays there for at least the next 21 hours (verified
>    via ps; last check was about 21h in).
> - While stuck, the FITRIM ioctl holds XFS allocation group / busy
>    extent state, so writeback workers and eventually every writer on
>    those filesystems pile up behind it. A DVR service wedged
>    completely; the machine (also serving as router) later became
>    unresponsive and had to be hard-reset.
> - md's sync throttling sees the array as idle the whole time (the
>    parked bio never generates member I/O), so the stall is invisible
>    in /proc/mdstat and cannot be influenced with sync_speed_min/max.
>
> Sample stack of one victim writer (blocked on the inode lock behind
> the writeback chain that is itself stuck behind fstrim):
>
>    [<0>] xfs_ilock+0x15c/0x1c0 [xfs]
>    [<0>] xfs_vn_update_time+0x1e8/0x268 [xfs]
>    [<0>] file_update_time_flags+0x7c/0x140
>    [<0>] kiocb_modified+0x3c/0x58
>    [<0>] xfs_file_write_checks+0x1ac/0x388 [xfs]
>    [<0>] xfs_file_buffered_write+0x13c/0x390 [xfs]
>    [<0>] xfs_file_write_iter+0x170/0x308 [xfs]
>    [<0>] do_iter_readv_writev+0x110/0x250
>    [<0>] vfs_writev+0x12c/0x2c0
>    [<0>] do_writev+0x78/0x160
>    [<0>] __arm64_sys_writev
>
> I did not capture the fstrim task's own kernel stack before the
> machine had to be hard-reset, so the mechanism above is from code
> inspection of the discard path rather than a captured stack. I have
> a scripted loop-device reproducer (loop-backed raid6, start a grow,
> mount XFS, run fstrim; expected result is fstrim permanently in D)
> which I have not run yet because the affected machine is a
> production box. I am happy to run it in a VM on request, and to
> test patches.
>
> The kernel is the v7.2 stable tag plus two local patches for arm64
> platform/PCIe bringup that touch nothing in block/ or drivers/md/.
>
> Suggested direction
> -------------------
>
> Discards are advisory, so completing the bio instead of dropping it
> seems sufficient: bio_endio() with BLK_STS_OK (treat discard as a
> no-op during reshape) or BLK_STS_NOTSUPP, mirroring what
> raid5_discard_limits() already does three lines below. Waiting for
> the reshape to pass, as regular writes do, would also fix the hang
> but keeps FITRIM blockable for hours or days on a slow reshape. I
> will leave the choice to you.
>
> #regzbot introduced: 90573092673c
>
> Thanks,
> Pim Zandbergen

--=20
Thanks,
Kuai
