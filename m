Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63963E7624
	for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 08:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668901; cv=none; b=CnZ0nMOMiOQyYjNN4FGz2VCW+zN9Qe8xJV7MoaCP4JbugDYY2tzHmjc69hZ9AqdcNiJl3zCHu0vucBU+s+8fmbHIhDYQ04mfRSFwASexXiETXULQKvzCiYRjWKe/FvUwam+mtp8PFFsNI4uxzn667UtF8P1DodjRfSjol1BpLGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668901; c=relaxed/simple;
	bh=2B/TYTbXRt8Au18SrvGStmKpgErFqex+vncLzTx34D4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I23NHz+5FQJljpwuvVysjsbBxsuIPShQEiS58TycRY04973xT2YFnLDH+YO1+trdf7VpKDICd9ZiEbVYO9LnQl4jolyr9LpSO9OeFOWSPR3xAMkwwgFXaXxm3UU9cEKmqyGw+MSdOZhReA5k2934m03r7vbHMJG3Ah/nF+kHDc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdKOpRFO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdKOpRFO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so24133985e9.1
        for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668897; x=1791273697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1zLcvYZn4VZi4U5hyO63YaC+RdJzk1Ftxp9O+4KGx0=;
        b=DdKOpRFOPfl2NXm/2yIkssdF91Kb1wSSdFfEUwQN5/oAIeGG1zJAN1DlblKiV404mC
         g1rmfBHAXAzwtOLe+7mJ+avU1TSO+PgFJ/jy8anTQCZnWRUdNC+SLVcV5viESYRBXTpp
         VMmjOfTzw7dP1IX2guh2mK6I1mSEomG6rgTXHEKDPT86nCXEqAwZ75HL7EDkw25iEeQg
         yn8Edp2/FiUD6zQIWOqMwGitzGvJ1U2PcFAmW3g3nRURk+MwXihJip0eWZ54eMXcLXb1
         IQHIrwjSGlh8jrNVP2vlpo8gXFGKE5U3AjmbsGpuz75lt3Fr8ziSAB2tF8P8EglTFxBL
         IdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668897; x=1791273697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1zLcvYZn4VZi4U5hyO63YaC+RdJzk1Ftxp9O+4KGx0=;
        b=meTBZhMZDqvXvkiqPPIfw0NyCtzmF5CkxqjrDdQZjtnE4OKrnsYhCOkrO6P6vdmz0Q
         4Ov8IiIYNzuP6/0LdFgp/gniaJTG4a9b4XWf96ZV7Wk2YDijMxGrg4vsCEGsaw1B4w89
         5xatP/ASPVzVoDxksmF5AQI66aDUUHYxtgjbYpNS6XAlr6t/UTOOCI5ca4OKseIKOWwb
         l6cnhCw/Pl0goGwRKhLcpgIn8FQ4otj6RYmZs+4dSFBvy+C9oDJwLkTqSfjrqKRQM28s
         v9kUlk9M6SizqhVxKped56hbZ13TK9RG6MSYqNdLbdzUoClwpidDl/9E411hjIz8GIeH
         51NA==
X-Forwarded-Encrypted: i=1; AKwUvBxhm3bc8Owg+Qzgn1aB5XhkvKXKzjJAI7yoYLqt1c/pcGcxHsYVrhThVsG7SFCuXJp+0ApTjtG3wXXfew==@lists.linux.dev
X-Gm-Message-State: AFuF++koR6z3WsuH249herqk0ycvMiwUZ1BMWeyVtbfDBAycz6Meg+/m
	7IonHkpzm6HsVQfrKr2BHvAhGx+b7OwRUGiBRxHeX4APopBYDcoldaaJ
X-Gm-Gg: AYBFou1SItI4tWZQyyT2EBtM/kjUrhbslCpJ2Y5PFKxf0UIGZNKfO0o4KiWOa9WT1kC
	gXps7kf05bKwrWp+D5PNb4FzN4iJaAsZyvAjapGys6gLfsGJ6er1FfCxJGUgoHZfPEUVvtyjWAN
	uDssd5Jos16Gh6cSM8lOfY+xWKRCIvxcxx3A/Z1S00pCuSkIF6pvO5shxzoxdzBZYFZSCj0Ph4p
	90et3lGjbqmOF+ZP6TyWTyb5vTLwLsrh8an8Ssm4yBh7kabjV5TN+VDGC7bJSKIMrzKpPsTJmVK
	opsBEm+PYlfiYHSwgKsx2CgH+p6lenESTDMxPP88By7ULMn7jforH0LT8DP/a5QcoSs0qHgNCuz
	J398tQTjWIcgX+b9OymiL21OIHnQxodp51lRWspFWboT+6Slk3yQrNFM8qDOZSyJmUTYQAa4xu4
	I05zuzBHhE6XgRx+nOK1yQnAHNYY0KX5D6s8vVZVNILoSs9X/OVfA1fXeYLJnl3rrIxRc7HdDlm
	FYOvYUK+B1e5f15it5xo+1JLqbbTG7yDEely7bPhMV8AZB2yteQnWt3dN3ovlAUfYg6MOAg
X-Received: by 2002:a05:600d:8643:10b0:49f:bb8a:b4ce with SMTP id 5b1f17b1804b1-49fe67bc26fmr190990405e9.28.1790668897384;
        Tue, 29 Sep 2026 01:01:37 -0700 (PDT)
Received: from corecachy.localdomain (p200300eca748c8fc021d81db54571dff.dip0.t-ipconnect.de. [2003:ec:a748:c8fc:21d:81db:5457:1dff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d46548fsm39832425e9.4.2026.09.29.01.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:01:36 -0700 (PDT)
From: Andreas Wild <andiwild@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	M M <restafvalendergelijke@outlook.com>,
	blaat windows <blaaaat@hotmail.com>,
	edwardmalik95@icloud.com
Subject: Re: [PATCH v3] PCI: Skip Target Speed quirk on clamped ports with no link
Date: Tue, 29 Sep 2026 09:59:16 +0200
Message-ID: <20260929080109.53944-1-andiwild@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87c93553-d74d-4588-bd54-0ccb2728f327@leemhuis.info>
References: <20260801201244.4421-1-andiwild@gmail.com> <20260917233355.GA1115024@bhelgaas> <b4ed1637-ac6a-4af5-ab47-e07309af200b@leemhuis.info> <alpine.DEB.2.21.2609181131520.57799@angie.orcam.me.uk> <1b2cceea-8da4-4239-a955-e0c6b475a227@leemhuis.info> <87c93553-d74d-4588-bd54-0ccb2728f327@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 29 Sep 2026, Thorsten Leemhuis wrote:

> No reason given, just a link to a diagnostic file that from a very quick
> look showed an Oops from the Nvidia driver:
> https://paste.cachyos.org/p/49a2487.log
>
> So maybe it's a problem in that OOT driver, maybe not. [...]

I had a look at that log, and I don't think it points at the patch.

It covers two boots, both on the same 7.2.2-1-cachyos build, which
carries the patch.  The second one, from which the report was taken,
came up normally.

In the failing boot the NVIDIA driver fails to initialise the GPU
("RmInitAdapter failed! (0x24:0x72:1281)"), and about a second later
modprobe takes a general protection fault in __refill_objects_node(),
reached from mas_preallocate(): an object still on the maple_node free
list had a zeroed free pointer, as if it had been allocated or written
to while still free.  The journal ends a second after that, so this is
presumably the hang the revert mentions.

That looks like slab corruption, which usually shows up in a victim
rather than the culprit, so the lack of NVIDIA frames in the trace
doesn't clear the driver: its failed-init teardown reported leaked
objects just before.  Another candidate is 4a724bcf5d70 ("mm/slab: take
n->list_lock in __slab_try_return_freelist() to avoid race"), which only
reached stable in 7.2.7.

Nothing in the log implicates the patch, but it can't clear it either:
the patch's early return is silent, and the report only has warnings
and errors from the failing boot.  One unexplained difference between
the boots: the r8169 NIC is at 33:00.0 in the failing one and at
30:00.0 in the good one.

Best regards,
Andreas
