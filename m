Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5963033EC
	for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 13:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789825684; cv=pass; b=TZo+9JWgtnWeqjJrAGe1ITVv3vpcYFEJOtKzBt/J4eTEjI1PDAbil1JGT5A+fnJNCzjcn4iw97ELQEVxfsLsOUCdOEFQByF+AVeoRFB1E0b15xbGLy2YTciO7zaH3O2845VMjzKBD/lu54AKzIZpIpG9rULDTT55J9mzjhHCv3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789825684; c=relaxed/simple;
	bh=uxDzFlXIhCWkpp4nn7OscT4I75j1F3IPZnT3erfb0Lk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kiAPWsrD46N7vNmTMrXmUD3TDgIQDnak3CVCua9VCrhJlodyVIIqcR7T3e4ZvZD181mwykHrunYu7oTpilBFV1D/jihKiUtdbH8cD1gRpQt/3k8kC5Aah6tzagSBd0fllyXjxCpxam3aSesJDJG/26Mqxmb5m/aMjwP0ocvp/eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVPh3R1o; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVPh3R1o"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1512542a91.1
        for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 06:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789825682; cv=none;
        d=google.com; s=arc-20260327;
        b=pFz/wUbki0uxdK4XI6HL0IQIDp4dabAJdQS8UL9qPiekUgcqaszVgYTX3jFimcTPBp
         d3IX6UxtH64k6Do+GF/1wZ1ct9CJ5oD/6KDIGTrPl/1Dj5GG1VUWB1Ggw93Z8/WN2Coi
         RStyWg3VmltWNiEoK5CzEvppwqXeSDv5OIePa0MUYed/vPQ4bHaS3AJooE70Jiqv7F8l
         hJwaEZCG15qCFxrx1PQY2DvQQbFEaYlNyo2HYO8yUqH5SVnv/UIEvWRrDToA6bqBmO1U
         ZDlquI2IjmwTGpOqoZDcKpN/AM4Dl0SsSM39Giix39eQXnyc92pGPSdn0TpiVLFkBg+p
         VjmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=sIIVnS4jjgLWZUNl3bwsvpIjYgvoUL8a8FSJ4KXXWw4=;
        fh=uhvrDdFg3cQn1OMaP8S83+WpCGUe6gdvVW2zeyVHhpg=;
        b=jS2ySKh0qFnG/viapl2YtIHqr4BugzVHi3GCgmNvXC4PlYb4nF1otjJFxXifUwP+Ej
         cH5ir6ky0e/s3rWbJOg/0R/cwzBWcijau43/ZY8YkSeNj4qoSDpB9KocLKPND2uJTPRp
         EyitQwI6yYvJ3tDbagsI8iD14fHu+5/p8QfeJga7UcAVzSQsiSSiqgXPXIgc7px2YHQ6
         yIXvWlGdWEAgoP50fErSVZ8Vcj6/ctreQhRLrK9DSjTsfA56M/eDPPRvvkTuSxfhJZPL
         6QNps0Lzd1EjFvQWxhLrbWW1lWqHxc90Dli+gaRdJ+xRftNj9xek/pcJupQY+vHP7i3H
         DFjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789825682; x=1790430482; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIIVnS4jjgLWZUNl3bwsvpIjYgvoUL8a8FSJ4KXXWw4=;
        b=GVPh3R1oUNyc/n3QEsCOlp8mL3zqU3AvbJpVqUlGWXQEtVnPuJ7U+fbvhEMRgBT7Is
         DEJfbtTg+KNrB+AGg0EuMX7UbVVgBWSV5Mgi3H3BiLnErZNrYSUh8xEX75zewpy80FZH
         4R3FWhZasAJewrc/Soi37jgszpaa9OaDFhddYSqYQ76lu/bhcVnamPy3inHSwIPb6krj
         XkUrD+p1JN7dPbBtZm6yEjfm2qAhQMl1zPIx1XjCilPGXdHfiCxSLzuMKqzgl7hnOu9R
         ULPIrEVfN0ZdkwPQo7AQc26jYY7ltQonqEShfq/WfIRURT3++0Z0RKYVtthGih9uVZTW
         uMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789825682; x=1790430482;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sIIVnS4jjgLWZUNl3bwsvpIjYgvoUL8a8FSJ4KXXWw4=;
        b=CMtUft+m6jMuGU6RBt1vkpLFVTIHhPfdCyerzeZJwg7fZ7sdMSj9uftiK+8vMZcTbK
         2jw072TUsACNEq8smLlNFH9Qd5pA3CpaM/x4kGXCviB4w2/MD3tD40mja7sAl9Jub4OT
         CvJDo3a9hSYUDw1PjXHDwvzZne/o5mXGQICDyXSKdpxcxb3MHVLt01ntG0kW9CNizhan
         pRtujBZks8Ze1Z83bzJujbXeEfmHvBeBmxsNj4WAl6/MZIofAFLrAlaptO1XqwLpRlN/
         96ClO3rS980hLBbcoTVQ+4pfAMKhe0BgCP1ElwIWmbx2SsQNaQwnQEjlRzeAEycgPUEC
         stZw==
X-Forwarded-Encrypted: i=1; AKwUvBwYFRDzVX71MXO09j66CSACXViU15TbhQ4UJ10vPCYqLexWAluYRkAPahEgihmxsfQRPwrByJEnTRk6Ig==@lists.linux.dev
X-Gm-Message-State: AFuF++lQxBP9B7lrqiCRqLGMgDJz+TOPSfB2zW3nDyfHJHOss/9tVsxt
	SOLzMG1eLLNrO5VjUAdJFwsCt+MhjlqTqQKDESCUeDBxbQPTPZVQ3AdMXEpOYv9vLyg9cEWPooe
	nYWdHC+KCXsnCBEojrqa+t8VxsPMRVuA=
X-Gm-Gg: AYBFou3ZnSt5ZOKy441tvbOm5jUkArCNK9eZTcz1F0U6LNPgINj+jWGecxiwrqulZ0q
	jXMf9UrhDxXhcJ6DUA8fktVx6e+MhMcIbD/E/zKWCmtmKv7hnuU38OkOQz5FTLPQcV1HcPesB8e
	Zq1S69WQSFTKr8gWlUE1Bd/f72hOTphpHK+Uu86v24Ag1LkFNhLTDW97dqzsixMhT0ZvHM4Kt3A
	F6bS1PiN1eRyl9ReSF01cbdEMbHJ/R80OOqMrOooYjEVuMWfQdKpvigkLn7gDXYhhRPUZSZ4c0f
	k5TLVmOJgW/78Z7cdF9N7zQbjkScOwavJxI6z2DQmCJaodCRWsD+dWL0rF3q2CuV9aOMUnjcnBD
	WqmLgmFruCYyyg80JFEC1asZzSPXakXeD19e83I8ii55HxfDuVomtmNEArWfOWa8D52+xWM4Pep
	MChWPibmM=
X-Received: by 2002:a17:90b:1dc9:b0:39e:6c69:7775 with SMTP id
 98e67ed59e1d1-39e6c697929mr4698625a91.30.1789825682239; Sat, 19 Sep 2026
 06:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: David Lomas <david.s.lomas@gmail.com>
Date: Sat, 19 Sep 2026 14:47:25 +0100
X-Gm-Features: AcwNN1WfyXVWtbUsXrdmQZGWXpS1W_8PSzgAYorOUUpF0oVLqT3c8afoCgKVMbs
Message-ID: <CALjEBWQo0-Sdimo+aRNKUQvgDGw=jBFCcfwCXaqVdtoPrHLAQA@mail.gmail.com>
Subject: Re: [PATCH 6.18 0167/1250] PM: hibernate: call preallocate_image()
 after freeze prepare
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: stable@vger.kernel.org, rafael.j.wysocki@intel.com, 
	matthew.leach@collabora.com, superm1@kernel.org, linux-pm@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Please note, I'm chasing a bug on this laptop using claude, and not
familiar at all with kernel development, so take what it's written
below with a pinch of whatever you prefer. But it seems pretty
convinced it has found the root cause of periodic freezes during
hibernation (whether from sleep on a timer, or direct via 'systemctl
hibernate').

Re: <20260917151556.616977299@linuxfoundation.org>
Upstream commit 783c8109844503bd1c35dab41b6d5fd074a9f131 deadlocks
hibernation entry on my machine (7.2.4, Dell XPS 13 9360, 8 GB, zswap
on) whenever the system has been in use for some hours: the hibernate
call never returns and the laptop sits warm with no image written,
seven times in ten days. Direct `systemctl hibernate` and
suspend-then-hibernate are the same. Never on 7.1.x or 6.18.49, and
never on a fresh boot.

Captured with SysRq (w) after ~8 minutes hung. The hibernating task is
in the direct-reclaim throttle waiting for kswapd, which was frozen 27
ms earlier by freeze_kernel_threads(), which this commit moved ahead
of hibernate_preallocate_memory():

  [ 8404.650787] Freezing remaining freezable tasks completed (elapsed
0.001 seconds)
  [ 8404.677608] PM: hibernation: Preallocating image memory
  (nothing further; SysRq at 8871)

  task:systemd-sleep   state:D pid:36677
   __schedule
   schedule
   throttle_direct_reclaim+0x358/0x3e0
   try_to_free_pages+0xbf/0x220
   __alloc_pages_slowpath.constprop.0+0x531/0x1510
   __alloc_frozen_pages_noprof+0x334/0x370
   alloc_pages_mpol+0xb2/0x160
   alloc_pages_noprof+0x49/0x90
   preallocate_image_memory+0x35/0x9b
   hibernate_preallocate_memory+0x25b/0x390
   hibernation_snapshot+0xc1/0x4e0
   hibernate.cold+0x117/0x4b5
   state_store+0xf2/0x100

  Node 0 Normal free:32044kB boost:119232kB min:172224kB low:185472kB
  high:198720kB ... inactive_anon:1601740kB zspages:362688kB
  377713 pages in swap cache

All four CPUs idle (SysRq l). Free memory is below the pfmemalloc
reserve (two thirds of which is watermark boost), so the GFP_KERNEL
allocations in preallocate_image_memory() go through
throttle_direct_reclaim(), which does wait_event_killable() on
pgdat->pfmemalloc_wait until kswapd raises free pages above the
reserve. kswapd is frozen, so nothing ever wakes it. The wait is
killable, so the hung-task detector does not report it either. With
hung_task_panic, softlockup_panic and hardlockup_panic all set,
nothing fired in eight minutes.

This is the concern Rafael raised on v3 (frozen kswapd); the reply
covered the I/O path but not the pfmemalloc throttle. Reverting the
order, or bypassing the throttle for the hibernation task (PF_KTHREAD
style), would avoid it. Setting vm.watermark_boost_factor=0 shrinks
the window but does not close it.

Full SysRq dump (l/m/w, via efi-pstore) available on request.

#regzbot introduced: 783c8109844503bd1c35dab41b6d5fd074a9f131

David Lomas
