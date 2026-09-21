Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954D4E4305
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025513; cv=pass; b=lG1jxxLUGjLriw2Nm7JbHujtc8P0Bs291rfvvCAuWegzhjfum3EPwSPY6K22kyHBC+zpdDtl5fmcIHuLioqdfDesDPwIF/jLseEGdZOWy1O/5Ia9rEDDu9lSlNNb9hBv2BboAaVos7S4BjfiXwHvVc1FTZ9GlV0MwfY1ggTvFsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025513; c=relaxed/simple;
	bh=brjRvH3C6Mu55blpnUj4kyKWqBF3ChBISvnfSPmnR7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIPr6GyUvLGbs6dyZqfUhLgNTT/E3k8EgTHOXwT9e1450VkGwB6x+TUPLtTLx2aG4N5cYWC/cpWSO76PIdljoi0/qukpSbr50KIlqLmv8DY3A02/3//JKHpVE9+81g1e0WEGBGiWFc96rQxhvHUvOk0n5fBIEtYhjQlCwhrVgr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4zM+/UC; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4zM+/UC"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso3047174a91.0
        for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 14:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790025512; cv=none;
        d=google.com; s=arc-20260327;
        b=KUipJl77NMIOn07iQN+i4Yiv2WEsMKsN4nHkLwrcRiRXITVhAwGqnE9YcqY+edzY6O
         CWd2IapYLsLOqE2DuuCFHAvRqotAfGVbLH1dZg5C0Tbns1EFvEWWgf65YL113aEYp4K2
         MF+LJuN8OZCgQ27hNJl7WiySi8jlrVHy6fU6n61hpjEPn7ccWloUKZm1qcniGBMrxkdm
         rNYD9j4ftwDwFPvcg0MK48CGSnUiJ8wZ+7MWjH0HDnDIE9jpLqemx+reEkFOUmSTcow9
         I9fDIDTpfnqWcjb2Y0tZsVMJFtw2/DqAfrSpNLHTSUVWql6il0u0x78ypaOgXL6/y7KE
         2AOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=brjRvH3C6Mu55blpnUj4kyKWqBF3ChBISvnfSPmnR7w=;
        fh=jmCg2AXA6fi9xYKmvzxxryW/YPTrZl34weuF0imE1rU=;
        b=rp4jsPFK19+oJtX/CnX8ID32za4oQPe+ADS1YaoAc04tokkc6K8qF29+qAJ+kSQ0ou
         CIgcUy8gaFln5V6OLm9JK9UnGCaGda7nIenJ6ImaaWL3TsJWh3J+vjV2Uv03hJYt5aES
         sNLE88bKu7pR+N6H2tNm41oNVpa+vIBcGBwmRHfBcV1oSxVPiMkCmJqZUkV1VW7ZKJjJ
         tqfrLD18uAH7sDTolvEfRfh0LPa0QXcqDh739BXw2I0m2deuUCph3g8S87Zxay9kM9+o
         tH+4RE6XvpGJQLNgcFC1Rc5T9dJOR+d1YP1kFnPz6hNoQnBEcnSABVLZkzxyX41DELDn
         AS2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790025512; x=1790630312; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brjRvH3C6Mu55blpnUj4kyKWqBF3ChBISvnfSPmnR7w=;
        b=s4zM+/UC5x1dFu8IvJ7eEJT0UZMf5Y7VRkKzUnhmqc/YVUUzfB2D80fR1XZI2CgbHe
         y0LXansYr/YCDQon4hlzfEzl3izsvzX5ELCLT8wF2bKyrDzBGpCnU6rWbel3sm/uOJcP
         s8MNqpIZHXRqYU/5geOf11kytNBxLSfmWfDOOvSMmYhHQ/UguDVb91GuG6l3e+5CEEgr
         4op6K8nJuqPtm1uxRaTtlXtRFtHgwn7wflAbHsbKfK6J4hCVnO80UbEVyzSUG3cLf/KM
         reu/eW9zS7SA840moU6XBLwQm/5tgND6I57+waqMQKfzupESFFqVxTNRUROVj/811dRJ
         OaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025512; x=1790630312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=brjRvH3C6Mu55blpnUj4kyKWqBF3ChBISvnfSPmnR7w=;
        b=NjJ9/wiv0jMxl0blK+SjTL9i1QU0vr6OPD0Wl+t+v7nyUCjw6mB4LbmFRGwNzrNOkD
         rY9fCU+ShwIVUU+EBehjG5aBaibeVueBEjRestzSWaE4Y2YZ+rweYWr8RxNecv6ZSNe0
         QiGaux1YcSTr1qkDUEVlEia6NI3cIdmvh19IGp2vH6BCDGUO10Ho7oE915VZVr2Ym417
         KAd6IalVGJZ8cPfcWaflM+VTpq8tQcoWHmay3AGWsgTEG0HCKMQZnM6olKNy+mXAwGeu
         jLRmGumChW1r/b1ssRwunXlgezB7Dg2M51PaX9HGoKROe8fiirsGMgWozYc/g0WvLlE8
         IJMA==
X-Forwarded-Encrypted: i=1; AKwUvBzk145OFCmRe+QW6ZQNAzDMO7D8oBdFXmdfPgrxrK+d2f5Z1Me5hOc/7NvV3ExU4DC5TAWSNsWIXn+b5Q==@lists.linux.dev
X-Gm-Message-State: AFuF++nNIbZPxdBaEZ56TnM4qlhdNnxb3l6zwRM+bMODymzHX0kci2ih
	QBmNQWocrZfR7Iv1GB4pitjPD0BuVFGE9qJkWonro1cnRlJC46aNTrsgwvDQgk4dmWL5pYD9uLV
	N2FN/RIdtY36VOtw/BvWiyLXmOFZSJKA=
X-Gm-Gg: AYBFou1GZS1XCxkyudJ3YvTk4ORG1HsowW8jG8woCcS336Ss564UGb/3fx1nqXPK6O5
	un2+TMMlJY4sezJNe1pHIRUyGCKaWiQSMgj3l4HYhUEQW2U2eTZp/54pnUc0L5zEm06fmoShH6r
	FJ7zTgzAtKkGbNDYCXyP/S7EJtUkORgqhnAAvxiq9RU0B4GCKHRSoxVIoSBWouq6nG0miUwoeap
	DK/hxCvY7Gkr0GS/rcT14UnxhzJWGsxlOKZRQYCHqk1Z+YTwIaFjADXghRRvnzljEjZbnSIzZHO
	4yQId4+sCFViGLUdnLREgQ3qm6PgGYGye7m8iBjldo0PmrHi6P29Hw==
X-Received: by 2002:a17:90b:2809:b0:39e:4c7f:8b15 with SMTP id
 98e67ed59e1d1-3a06ae45c96mr221446a91.26.1790025511678; Mon, 21 Sep 2026
 14:18:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CALjEBWT9wyBYtWPgtg8Xd_FxRU_XnatzQMcwMB9_P2Fdj83+cQ@mail.gmail.com>
In-Reply-To: <CALjEBWT9wyBYtWPgtg8Xd_FxRU_XnatzQMcwMB9_P2Fdj83+cQ@mail.gmail.com>
From: Hic Haec Hoc <h.haechoc@gmail.com>
Date: Mon, 21 Sep 2026 23:18:20 +0200
X-Gm-Features: AcwNN1XDR3liA0aUKbpLmsIaVZiCpdO_7eTgmIqmdYIp2_7ENPKfCo1bzTJtA7k
Message-ID: <CAKp=m=DkRA3FQdJC+1AKDtn1X8ZuO0HRF5H7PJVf15uQyBuEbg@mail.gmail.com>
Subject: Re: [PATCH 6.18 0167/1250] PM: hibernate: call preallocate_image()
 after freeze prepare
To: David Lomas <david.s.lomas@gmail.com>, Thorsten Leemhuis <regressions@leemhuis.info>
Cc: linux-pm@vger.kernel.org, rafael.j.wysocki@intel.com, 
	matthew.leach@collabora.com, gregkh@linuxfoundation.org, 
	stable@vger.kernel.org, regressions@lists.linux.dev, 
	Florian Schmaus <flo@geekplace.eu>
Content-Type: text/plain; charset="UTF-8"

On 9 Saturday 19 Sep 2026 at 22:53 David Lomas <david.s.lomas@gmail.com> wrote:
>
> Same commit, same symptom: my report with the blocked-task backtrace
> is at https://lore.kernel.org/all/CALjEBWQo0-Sdimo+aRNKUQvgDGw=jBFCcfwCXaqVdtoPrHLAQA@mail.gmail.com/
> (XPS 13 9360, 8 GB, zswap). The hibernating task sits in
> throttle_direct_reclaim() waiting for kswapd, which
> freeze_kernel_threads() froze just before
> hibernate_preallocate_memory() ran.
>
> #regzbot introduced: 783c8109844503bd1c35dab41b6d5fd074a9f131
>
> David

Hello,

I'm replying to this message because I was not CCed on the later ones.

I can reproduce the issue quite reliably on this machine, and with
Florian Schmaus's patch applied on top of 7.2.5 it survived ten
hibernate/resume cycles under significant memory pressure without
hanging. I can't tell if it could reintroduce the problems that
783c8109844503bd1c35dab41b6d5fd074a9f131 was trying to avoid but at a
minimum it seems to fix this particular deadlock.

Best regards,

H.
