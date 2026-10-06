Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0BE034D389
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 18:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791309875; cv=none; b=PYJpIPXg4xiPaQmO2THsF+a0yzrByXSkaswhcW5EzG4YWXrj1Nv5PDVuC5rCw0AYFED7MX0cIxDQQcJb9hBpybMJruuNXZOcRB+kj2e/Ld/7468Lh8w4+fsD8r/nbdLXR4uaV4jDU7XCfUp3jQaUx2aJHym/nlU14096sahyqoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791309875; c=relaxed/simple;
	bh=KqPuqtpJlRIIDW4Sq6DZiOz+Xi5ldq0JKOWdYlr+o9w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5jajWpKDU7F2iQpfCBZnRuJFuMiKHRau53k7LlZLEU5m7iTeJ826ZU/4e+WgK9pMG2r27XFtjWgMrD+awUZHePTlcFMCkPaK1rdEn2/PjXjf3NinVtO7yPoDvcKlDaoLHdp+E3M5/n7BFWzXsvxoYDV025ugxwvDlVKu8t8OEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saurla.com; spf=pass smtp.mailfrom=saurla.com; dkim=pass (2048-bit key) header.d=saurla.com header.i=@saurla.com header.b=K86VFwZl; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saurla.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saurla.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saurla.com header.i=@saurla.com header.b="K86VFwZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saurla.com;
	s=protonmail; t=1791309865; x=1791569065;
	bh=fN/8Q9VfW/xYyi6I6crPTJPP47IqEygQBDb0uZseVWc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K86VFwZl6D8uKgSFc9MpWy9N51q3t79ui6G4guM/b78kTn4GDrRnIHpI1y7mSXu4B
	 UJfrHIhr4p5OcrLWjDADq1lHfGA2GWKOh7i170PHlK2zHi/mf+mVLyqZfH6tRQdH1e
	 14j+tzphPeEj+t0rP3f7qCVGjgLFzpqRJxJd9wldpj4bGb1tMkswVxH7Yjd+aSXo+0
	 j4Ml8zuqjJt2lMvmzqPtQVmFfctxMqjA97dItcTUb5Cv67w930poMS7P932FY8Hajf
	 weCLDWkEkid1Dzp8AhIr54iLc0r/q+GgRWFX1KjrY0qJMLGig/lB6UYQsjzpUrkB31
	 may4M1tdbJAMA==
Date: Tue, 06 Oct 2026 18:04:22 +0000
To: Frantisek Musil <lister@gamesplit.cz>
From: Lauri Saurus <saurla@saurla.com>
Cc: Jiri Kosina <jikos@kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "jkosina@suse.com" <jkosina@suse.com>
Subject: Re: [REGRESSION] HID: logitech-hidpp: commit f0866517be93 breaks hi-res wheel scrolling over Lightspeed receiver (G903)
Message-ID: <pFprW5RFjs9iH705M5zdueiM6SNAbThCFeYaiQxtN2yUUCdthyn0YY0ZZGdbQFMIbR598puKKBU0E3X6pEwMPpiczEO8pk1vayojyY6EEwM=@saurla.com>
In-Reply-To: <cb961991-b746-4f8f-bb76-c597b35a908b@gamesplit.cz>
References: <9950dea5-ccff-4ca1-a7ab-98e2b494a284@gamesplit.cz> <77888c45-0b12-4973-a9c8-9aa5d70eb1b5@gamesplit.cz> <0IXbR44wf-idjlLSV2kHpzPm88Rs_orpaG-CJumHqfydxGdMNnuobRi0Oz8lW2cdpibztLCb1HK2MpcAw3lgsCzSmugEbQBf70Zjooz6ZLY=@saurla.com> <72d144aa-bd56-4ee5-a504-9cfcb329eb44@gamesplit.cz> <pI2--urSOUMdyRKpMPDftneDAGdGm05IPF8Xt8FhYnOLhbErUDQRh_6Yq1wqKW6559W2APlI2QtM03TJOrjRobiIoUSsMOrutYfyZP0W3OY=@saurla.com> <dfbc41ec-7200-4178-9bc2-a8b4d6b9654e@gamesplit.cz> <Qcqpyk51pmEh4pab4ob63O_xwOfVnMZbRigEHshfaClUdXYlQgHvsdGqCqGyI8o8XctHqVSDpoTW5Ngsyz03wlX9ghiv8dpLREphQW8Gppg=@saurla.com> <d9ec6806-e5e9-46c0-9b66-d35f26e5fb51@gamesplit.cz> <WWHkaf8Fk3zaWHcBeGqqPKAYV1H_94FretNmyieXeN_Tqk8zTSw98uJYmTYRSDZbIjPfSGLQynGQXq4c9lAqDx19B1s7cbXCgJxgKEG_dW8=@saurla.com> <cb961991-b746-4f8f-bb76-c597b35a908b@gamesplit.cz>
Feedback-ID: 198286868:user:proton
X-Pm-Message-ID: 6e84a31c0446fd61a99d4ebf7318b7801f73a5ed
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi.

> Also saw in the original review thread
> (https://ratatoskr.run/linux-input/2026/05/16995921/t) that it
> onlyhandles REPORT_ID_HIDPP_LONG (0x11), ignoring Very Long (0x12) -
> yousaid you'd add that but it doesn't look like it landed. Captured raw
> hidraw traffic during SetWheelMode (kernel and Solaar) and whilespinning
> the wheel hard. Never saw a single 0x12, only 0x11/0x10. Sodoesn't seem
> to be it for my hardware.

Yes that never landed but it should not matter. That path anyway only handl=
es SetWheelMode responses which are not happening at all if Solaar or other=
 user space tool is not used. As we saw from the debug logs in the first te=
st. And even if some SetWheelMode was not handled, then it would only mean =
the driver would work exactly as before.

What browser are you using?=20

One more test I can think of is to produce evtest logs in controlled manner=
 with failing and succeeding driver module.

1. Make sure all user space tools that can send HID++ traffic are not runni=
ng (libratbagd, piper, Solaar, OpenRGB)
2. Make sure wheel is in ratchet (clicky) mode.

3. Checkout f0866517be93 and compile the module
4. Load the module
   sudo rmmod hid_logitech_hidpp
   sudo insmod hid-logitech-hidpp.ko
5. Unplug and plug the receiver
6. Move your mouse and wait few secs to make sure it is awake
7. Start event recording with: sudo evtest
8. Run the test:
   - Scroll 10 single clicks DOWN. One click at a time, pausing couple of s=
econds after each click.
   - Scroll 10 single clicks UP. One click at a time, pausing couple of sec=
onds after each click.
9. Make ~5 seconds of continuous scrolling in one direction without changin=
g direction.
10. Stop evtest recording and store to a file

Then do same steps 3-10 again by checking out f0866517be93 and  reverting c=
ommit f0866517be93. If you have time you could do the test again with both =
commit f0866517be93 and then commit f0866517be93 reverted to have 4 test ru=
n in total with logs.

Make sure to use same WEB page for scrolling each time. For each test, note=
 whether scrolling felt unusually fast or not.

Then send each of the log files to me, and I can try to analyze if I see so=
me difference in event generation between the driver versions.


