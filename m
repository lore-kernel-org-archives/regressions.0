Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4763480DD5
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204177; cv=none; b=Y9Ls9qJ7wJcZcSPRZhP3UgGwTOVnGJzR+0D91kYqmFiUYR9hZjRBxaP++JS0T7g1WDctjnoHEzqZm8vYJluHePXPmU3xVZdCglo7yPC5n0HCuJdCNbmprXENYuW2uj0T4geNTeKQkWwU8uOPtSZ2KoPavjo9SD0jdtkJAL6bIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204177; c=relaxed/simple;
	bh=j3bRD7sp+xdB/QpcILx1dKScC4VCImxPUPmdgtm3Xok=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKse3+/ClUwAqD+P+eLs7kbc5PULg7zlTug/reyOSbh4ACE4F9vRDFQVKzDPI9JRZli1Ao14q5hxE8lTCKFkzU8jWvlotpzI+0BOqL4Pf/aQkK3QOMtP0eujQUXHFhhAVmxB719Xri09y2xeCfcNdRzjKqZ+S5PZNoNxp9qBxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saurla.com; spf=pass smtp.mailfrom=saurla.com; dkim=pass (2048-bit key) header.d=saurla.com header.i=@saurla.com header.b=dqCbLIPO; arc=none smtp.client-ip=109.224.244.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saurla.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saurla.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saurla.com header.i=@saurla.com header.b="dqCbLIPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saurla.com;
	s=protonmail; t=1791204165; x=1791463365;
	bh=j3bRD7sp+xdB/QpcILx1dKScC4VCImxPUPmdgtm3Xok=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dqCbLIPO1orDTT0u7vSNtXDmRsB1OdNrR3vjWCNYueZ/KSJiQKO0j0GupDi1zcKbl
	 uB2uwekhJn/cyFyHtbJQde/VZyzf5X54g73NlkptRosCwuQminjlA3k78U9sKq70KX
	 OmiafGjRBgU1Tm0XjBW04FOBuKRq+CXhaFJQ5uk3OOLPU3s/pt5V6XDEY1s3VkDAwD
	 +42Hzsw+szua/yGQzOLfIsF7JFqunsFdiMCUxPsxGjWPd/OIsg5Q83SK0cWvOPO0qQ
	 WjbVf1R6z2ONYVnhkRFaa7JIbwdJsvdT+NnHbmwMKkA422RrsaR4e7KpDZSRVM5MZS
	 UiCbZTbwcd5Og==
Date: Mon, 05 Oct 2026 12:42:41 +0000
To: Frantisek Musil <lister@gamesplit.cz>
From: Lauri Saurus <saurla@saurla.com>
Cc: Jiri Kosina <jikos@kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "jkosina@suse.com" <jkosina@suse.com>
Subject: Re: [REGRESSION] HID: logitech-hidpp: commit f0866517be93 breaks hi-res wheel scrolling over Lightspeed receiver (G903)
Message-ID: <WWHkaf8Fk3zaWHcBeGqqPKAYV1H_94FretNmyieXeN_Tqk8zTSw98uJYmTYRSDZbIjPfSGLQynGQXq4c9lAqDx19B1s7cbXCgJxgKEG_dW8=@saurla.com>
In-Reply-To: <d9ec6806-e5e9-46c0-9b66-d35f26e5fb51@gamesplit.cz>
References: <9950dea5-ccff-4ca1-a7ab-98e2b494a284@gamesplit.cz> <77888c45-0b12-4973-a9c8-9aa5d70eb1b5@gamesplit.cz> <0IXbR44wf-idjlLSV2kHpzPm88Rs_orpaG-CJumHqfydxGdMNnuobRi0Oz8lW2cdpibztLCb1HK2MpcAw3lgsCzSmugEbQBf70Zjooz6ZLY=@saurla.com> <72d144aa-bd56-4ee5-a504-9cfcb329eb44@gamesplit.cz> <pI2--urSOUMdyRKpMPDftneDAGdGm05IPF8Xt8FhYnOLhbErUDQRh_6Yq1wqKW6559W2APlI2QtM03TJOrjRobiIoUSsMOrutYfyZP0W3OY=@saurla.com> <dfbc41ec-7200-4178-9bc2-a8b4d6b9654e@gamesplit.cz> <Qcqpyk51pmEh4pab4ob63O_xwOfVnMZbRigEHshfaClUdXYlQgHvsdGqCqGyI8o8XctHqVSDpoTW5Ngsyz03wlX9ghiv8dpLREphQW8Gppg=@saurla.com> <d9ec6806-e5e9-46c0-9b66-d35f26e5fb51@gamesplit.cz>
Feedback-ID: 198286868:user:proton
X-Pm-Message-ID: b79b2a4c5c1350559c69e704011b277e6632bd4e
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi.

Thanks for the logs.

> Right after receiver connect, no Solaar running, every REL_WHEEL_HI_RES
> event has value 15 - never 120. So the value itself looks correct. But
> when I counted how many of these fire between each legacy REL_WHEEL
> click, most are 8 (correct), but quite a few are 9, 10, even 11. So
> instead of 120 units per physical click it's sometimes up to 165 -
> that's the "scrolls too much" I'm seeing, it's not a wrong value, it's
> extra events.

I checked the log and did counting also. I did not find any range where the=
re would be more than 8 REL_WHEEL_HI_RES events in same direction without a=
 legacy REL_WHEEL in between. I did find some ranges with 9-11 REL_WHEEL_HI=
_RES events in a row, but those were such cases where scroll direction was =
changed (15 vs -15). Eg. rows 2981-3002.=20

Based on these logs it seems to me that the driver is behaving correctly. C=
an you verify once more that this commit f0866517be9345d8245d32b722574b8aec=
ccb348 actually is what breaks the scroll for you, by checking out this com=
mit, reverting it with git revert, compiling against your Fedora kernel sou=
rces, loading the compiled hid_logitech_hidpp, and finally testing whether =
the issue persists or not?



