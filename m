Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96803FADED;
	Tue, 26 May 2026 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802706; cv=none; b=lX9/XOJUfRYyacre+suP8ggtHNlWR1mqLZKaqQV/eEZ4ERnugOfChLv3PrRg9fxIlU0+buGZJCf5r8ILWPcjeLy2MrRZjnvOwDPoNOhx+FstfkSaYu1Fk8VW1Sbj8nNGG0G3If9FtaRx6GwyHsdlVxyRPZDTfP61qprd5Sk5d+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802706; c=relaxed/simple;
	bh=bA2arLRw6MrFzjf4q674YQ3U0FDOAobtI8xjknfdPiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sel7I3TRxXmKPJgP9Bh7S6soLNEIlYg+dXBnGbF0JfUK6QF01CgTBgwCpWrZUiXHqR241E6uj46rTvCTH1T2Dj5nMSsRwitFGsod5WU4lA6ApP/L4N58HskqHV9rHTkmA4MpTzeGNbR+SyKolTStfTKfE3NFLSiwJax5iM3OfNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mfOfhKQH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mfOfhKQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA6C1F000E9;
	Tue, 26 May 2026 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779802705;
	bh=YmkPWGaUZd7ofALFSfwSQbmMqOkx/9YpJHcA7pI+x4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mfOfhKQH98PCbed9Ss7W9LkrDIA+x0YoESNCd6CyAFsaD51FJZOCvgE7UdtoFXEIS
	 xmGlbdyUkxOR3ggNNnLCilMfwpTbk9Wi2nPCdt+KMYB2IpuvgG+/LWjn3V2DAOCJf/
	 3cXbVFxDF6ExDwwLdHQTYDVl1RegiKSVUzf3WWGQZ4WGy/1ke7OktKSlKMb+zHF2tI
	 8BZvOVHr2YLDnjy8fbcKszJ7WE+yrQT6m4a/HQN0VV7zVYKqH4l/jQ7hu+IrDskT2f
	 z+frIKB1dck1kdSN6fA2nlgbo+iji5+CSOpw2vmU+clHAqRBKTb9dASOVDhy+2Mh8W
	 nek3ZGBYBbWrQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	regressions@lists.linux.dev,
	willy@infradead.org,
	brauner@kernel.org,
	Oleg Chaun <olegchaun@gmail.com>
Subject: Re: Subject:[REGRESSION] fs/qnx6: incorrect pointer arithmetic breaks dir scanning completely
Date: Tue, 26 May 2026 09:38:15 -0400
Message-ID: <20260526140000.agent5-0003@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d02905f7-6ef8-4df0-bb55-dea44fda6ce2@gmail.com>
References: <d02905f7-6ef8-4df0-bb55-dea44fda6ce2@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, May 26, 2026 at 12:40:12PM +0200, Oleg Chaun wrote:
> Commit b2aa61556fcf ("qnx6: Convert qnx6_get_page() to
> qnx6_get_folio()") breaks qnx6 readdir on 6.12, 6.18 and 7.0 by
> dropping the QNX6_DIR_ENTRY_SIZE scaling in the entry-pointer
> arithmetic.

Thanks for the report. As Thorsten noted, Arpith already posted a fix
at:

  https://lore.kernel.org/all/20260310102233.391113-1-arpithk@nvidia.com/

with Al Viro's review feedback still pending. There is no upstream
commit to cherry-pick yet, so I cannot queue anything for stable until
an upstream fix lands.

-- 
Thanks,
Sasha
