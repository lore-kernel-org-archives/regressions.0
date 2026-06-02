Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9E3C9ECF
	for <regressions@lists.linux.dev>; Tue,  2 Jun 2026 11:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780399566; cv=none; b=YI7wBD6mdPqiQ7gqFgmxpXG2wO2vB3nHlRLlvUN7tW/mg3DLW413IXNANFk5ayd2wMLnGGKlcnrzFccwXxioTdet5aNTz4YmGhWL95TIIc7Z6T96IWdXTApjQHqn4ElqzXaCoot2RHjKeDCJhLQFiDJf30tmvrQdTpaCoXMEMfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780399566; c=relaxed/simple;
	bh=Pz62QgA5sydDrg/K6JTj/fvfr0i81/qK2+zQrnMrFeY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XAcUpCyTYfEQt6ZBUPPukiNlc56L7Y3XDR1TNw1j8mmoA/3VRhL+NTrVJy9cvPDHhb1tV+nez1/33fS4OFbhdmsFpP7hWnKYAiio/GE5loEAdR/puMjtskT7Tysb+STtKRAEidWlaFqrO2kfPOzsoudKMuHxjMzDBcnYRS6QA/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=LBfNWYS2; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LBfNWYS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1780399557; x=1780658757;
	bh=Pz62QgA5sydDrg/K6JTj/fvfr0i81/qK2+zQrnMrFeY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LBfNWYS2Fh/wtB/Iu3e4+/JfZHsiOCawsX2MJO+YiVz3uczNAfhpjcrHB0YnTRrWO
	 GBYeIxl7bMvkJ9mgg0zhp24QFpIEKVPSTnIhz2sEb+Gv080S+dvg2WVD3zK8B1Ow2g
	 KGnddv202TByvv/Tdf8lun6LP4EFtshdnoHKa4ZJWLkEZCkXU8nB+8/xcKTCPjk0qX
	 IpCOnUBpO862HD1XdPyrVbm7UJTRzI+U9Kj9ZHhN7Un/f7sICPU45R+zAaV7BtBoLp
	 5tlkoAE753vRNER1VRhu2CjqI6BdziiPX2u2iJnaRN2Z3r1b5TpBwOD2XlDlkXvVS4
	 kYOGc9aMefvoQ==
Date: Tue, 02 Jun 2026 11:25:52 +0000
To: Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev
From: Tj <tj.iam.tj@proton.me>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, Rafael Passos <rafael@rcpassos.me>
Subject: Re: [REGRESSION] RIP: 0010:hidinput_setup_battery.isra.0+0x6d/0x370 [hid]
Message-ID: <21e69916-1cf1-462a-9578-145918a07de4@proton.me>
In-Reply-To: <b84a408c-b12c-40e5-b44b-62aa072cb285@leemhuis.info>
References: <ah6vRH9J9LSvnKWW@mail.iam.tj> <b84a408c-b12c-40e5-b44b-62aa072cb285@leemhuis.info>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: b930cfe45a05467e32eade3f4c0a9f3c5e328cfb
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

v7.1-rc6 + "HID: Input: Add battery list cleanup with devm action"=20
confirmed fixes the hidinput/bluetooth issues. Thank-you.

On 02/06/2026 10:54, Thorsten Leemhuis wrote:
> On 6/2/26 12:24, Tj wrote:
>> Hitting this repeatedly with v7.1-rc6. Do not have time right now to
>> bisect it (and there are two other regressions at the same time).
> Again, not my area of expertise, but this looks somewhat similar (but
> also somewhat different!) to this recent regression report from Rafael:
> https://lore.kernel.org/all/20260602011949.2825852-1-rafael@rcpassos.me/
>
> Rafael (CCed) sent a fix for it already applied:
> HID: Input: Add battery list cleanup with devm action
> https://lore.kernel.org/all/20260602030519.3097058-1-rafael@rcpassos.me/

