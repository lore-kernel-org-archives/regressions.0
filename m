Received: from mail-244117.protonmail.ch (mail-244117.protonmail.ch [109.224.244.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787336B914
	for <regressions@lists.linux.dev>; Sun, 11 Oct 2026 18:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791744204; cv=none; b=AK07k00ZHIT8AxczkMB4nE1Ns2ea6yph2mwGQC3jCG1Ctxgjwaz4XUQ3wvNBqCkaxsw+iLRkdDA7CP3mv1YKpnJCoYd6CpLcOW7wkgWlWSzeqKTw3VsK/cNYne1jWdK7+3i6RaRTyIh50ljjSentB7/0khPhrc5U5wcdQ0Cz18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791744204; c=relaxed/simple;
	bh=PqY7/TsMqi3xDADg98+XeYD/yOsSOvK2QGfQlQDJNpY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/HO2c6qUEX2kJYjyVAcwRy7s8eQlRKrj4s0q0S8RQn4iO24InwGWElnTan/4UtQcjzoC+ZkctorJD0g0vfqVDhelYWscwXHZ0BUBDyD85a82E2jFWzrBwDXnuX52GsqAR5deYYZeJxVu0T+sGdKP+r10p+GG1fv7JEPIDkjPK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saurla.com; spf=pass smtp.mailfrom=saurla.com; dkim=pass (2048-bit key) header.d=saurla.com header.i=@saurla.com header.b=PbukLJsQ; arc=none smtp.client-ip=109.224.244.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=saurla.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=saurla.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=saurla.com header.i=@saurla.com header.b="PbukLJsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=saurla.com;
	s=protonmail; t=1791744193; x=1792003393;
	bh=PqY7/TsMqi3xDADg98+XeYD/yOsSOvK2QGfQlQDJNpY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PbukLJsQeZvw+IH80bJ9t/QTIcR+BWGMWGUo5ERXV0Qjk1wBVo7Y7A3eURivVTkpb
	 9/Zyvqy2UA4ciAQp5d8KQONZC1ZXMV1hRZgWVLtb88ifnE883Z1HHG2kLF4efFh885
	 2mHHAixMa1WkhSbH0DECe9qem7SpnHbCwZLIBhN2WEHhzXuJsCdfkWXhX6t+dO1eoK
	 O1+OeufMfIQToTPv+eI2pfJt+j0HxqVerp1vXwnr+kLAUFG7XAOeGZGP6U8AdTc3ol
	 Sx1ct3A6DDqUR5PQf+RuBLWY4MN9MnVWMC4YEhIZhrphrWLdxhzLK9tEmqJnxN//xJ
	 DqUM1VcPmRpCw==
Date: Sun, 11 Oct 2026 18:43:09 +0000
To: Frantisek Musil <lister@gamesplit.cz>
From: Lauri Saurus <saurla@saurla.com>
Cc: Jiri Kosina <jikos@kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "jkosina@suse.com" <jkosina@suse.com>
Subject: Re: [REGRESSION] HID: logitech-hidpp: commit f0866517be93 breaks hi-res wheel scrolling over Lightspeed receiver (G903)
Message-ID: <s3TGXgN0OxCsL9qEsHjcTAFxET86V72Zbk3JlqOByNHJrfX8MbSfi-MxH6yP_JYXEtV1_7EmqZMQU8xaRG8PEZmRTrNGvLZV7RsrFbxIfPQ=@saurla.com>
In-Reply-To: <20954143-d35e-4d08-8e9e-1a7be0ff2343@gamesplit.cz>
References: <9950dea5-ccff-4ca1-a7ab-98e2b494a284@gamesplit.cz> <pI2--urSOUMdyRKpMPDftneDAGdGm05IPF8Xt8FhYnOLhbErUDQRh_6Yq1wqKW6559W2APlI2QtM03TJOrjRobiIoUSsMOrutYfyZP0W3OY=@saurla.com> <dfbc41ec-7200-4178-9bc2-a8b4d6b9654e@gamesplit.cz> <Qcqpyk51pmEh4pab4ob63O_xwOfVnMZbRigEHshfaClUdXYlQgHvsdGqCqGyI8o8XctHqVSDpoTW5Ngsyz03wlX9ghiv8dpLREphQW8Gppg=@saurla.com> <d9ec6806-e5e9-46c0-9b66-d35f26e5fb51@gamesplit.cz> <WWHkaf8Fk3zaWHcBeGqqPKAYV1H_94FretNmyieXeN_Tqk8zTSw98uJYmTYRSDZbIjPfSGLQynGQXq4c9lAqDx19B1s7cbXCgJxgKEG_dW8=@saurla.com> <cb961991-b746-4f8f-bb76-c597b35a908b@gamesplit.cz> <pFprW5RFjs9iH705M5zdueiM6SNAbThCFeYaiQxtN2yUUCdthyn0YY0ZZGdbQFMIbR598puKKBU0E3X6pEwMPpiczEO8pk1vayojyY6EEwM=@saurla.com> <20954143-d35e-4d08-8e9e-1a7be0ff2343@gamesplit.cz>
Feedback-ID: 198286868:user:proton
X-Pm-Message-ID: d96fa9c1b341f54f3b85ba3401661f5f4bf78838
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Frantisek,

> Before the logs - something that's been bugging me. For my setup, if I pl=
ug the mouse into a kernel with no Solaar and nothing else running, it scro=
lls fast, almost unusable. Only after I disable hi-res in Solaar does it sc=
roll normally.=20

Seems like I have misunderstood your problem. Do I understand correctly tha=
t hi-res has always been too fast for you and now with the commit f0866517b=
e93 the lo-res is also too fast? Before f0866517be93 the lo-res was fine?

To me this sounds like you might have the scrolling speed set too high at t=
he desktop/compositor/browser side? This would explain why commit f0866517b=
e93 made the lo-res feel too fast also.=20

Before commit f0866517be93, the lo-res mode was basically broken at kernel =
side. It sent only one REL_WHEEL_HI_RES event with value 15 per whole scrol=
l click instead of one REL_WHEEL_HI_RES event with value 120 (only every ei=
ght clicks sent REL_WHEEL event). This caused extremely slow scrolling on l=
o-res. But if you had set the scrolling speed higher at the desktop/composi=
tor/browser side to mitigate the slow scrolling of lo-res, then lo-res seem=
ed to scroll "normally". Hi-res which was emitting correctly 8 REL_WHEEL_HI=
_RES events per click with value 15 (120 total) scrolled too fast. The comm=
it f0866517be93 fixes the lo-res to also work correctly and emit one REL_WH=
EEL_HI_RES event per click with value 120. The desktop/compositor/browser s=
ide scaling would then cause the lo-res to also scroll too fast.

Can you check if this could be what is causing the too fast scrolling for y=
ou with the f0866517be93 commit?=20

The event logs seem all fine to me. Both commit f0866517be93, and it revert=
ed, emit correctly 8 REL_WHEEL_HI_RES events per click with value 15. So ba=
sed on the logs I do not see a regression with the commit.

I also have the G903 LIGHTSPEED mouse myself now, so I was able to test thi=
s myself. For me the scrolling seems to be working fine (same as G502X LIGH=
TSPEED). Tested in Firefox with Solaar off with commit f0866517be93.
