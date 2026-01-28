Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6817C376468
	for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 20:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769633312; cv=none; b=broaH5drzWq8cTE6mZCj3B6YB7ERhQqVmi9cxz2bcSFML0l/P90hozqOifyDwCLjW9wcporQ/NmfhIrgMorjHyAvBJYS549UEtQkKLg4dFQSU7NkK9fNCq9v/E0GozleE6/1o21s0pdPb0HFOjCwOGQbzYqEbShUHIyt5XJJ/uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769633312; c=relaxed/simple;
	bh=Tmy4k2xKhrAf/0LgCmt9wmGMpDFB1T3SpXE/Ry1zOpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=YSBKBibcW/kXQLGJ/rwV3lNmeEtclFOt51L5LiMrwWq0STLfM7xNMY3O8iQvnQxNvIZosKNl+LygYbDYxRuu72jLBHLguAEMdaqCR4g8mOrDphIiv9zwhK8rQEpEbrIrstWQ6S0EKnwVTW/jNai/Zxl5ef+wvsjJHQBeibOMZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BrWUewjV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BrWUewjV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769633305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e7NjC70Wbx6k2PSI9JfnskuYqjv2MVHWZWOdPzDzqJk=;
	b=BrWUewjVlSg5XW+TSqJCA7HIwi1/xqYyE4NCvuFJrPVPuw9MCpzapovQ4/Wz5PLoroMnvV
	EcEO3Nxl5FbMWBBd2ATnP0bXJEmCjN6Vv+raA32Is6bAwG1hrBQZtpLCGhOPmqvGoq3PTQ
	kC/fdkS14Mv4B1VscB5EEYUhawOH4sI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-RW3ZYDMyMtG0GPkRCbLABw-1; Wed, 28 Jan 2026 15:48:23 -0500
X-MC-Unique: RW3ZYDMyMtG0GPkRCbLABw-1
X-Mimecast-MFC-AGG-ID: RW3ZYDMyMtG0GPkRCbLABw_1769633303
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2ea47fa5so12805386d6.0
        for <regressions@lists.linux.dev>; Wed, 28 Jan 2026 12:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769633303; x=1770238103;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7NjC70Wbx6k2PSI9JfnskuYqjv2MVHWZWOdPzDzqJk=;
        b=XykP7g1UnshmuRKzXvXK2yoqvY3bzjYwlel39AD7wIMe2djLJBC/JmvSmTGV2sAt1E
         OSKaGzzx2KSX09A7M/5L6JuKiBjZIG6d/XImsCZp/qqnwHoC/WsZbHV6M8gljTMZWedQ
         ll6uMVJ1AC3ymgvV+er/hjkfaxCgsbc2rAkAgc3MiC4pf+PpNrYxUESsrQhq2q4I4w1U
         7f17XbsR4BuOXD7Uiq/J/m/JPSiA7EXkxoTrqQ+dG5OykOiiRVqhmIbgSMzC2NJae59c
         A4DRwEQLkoRWVIQRc96Ti9e3LDLaHkRBEO/czpfXW/kPgZgm3e7lX/EXHr7HqtVNw4QR
         EpgA==
X-Forwarded-Encrypted: i=1; AJvYcCV1HXFCTgz3D2sw3eXgtNp3srsq5/GtHDalbHu//CkRwnqdTHAH2MGkeBPorgkfxv15BtK+qnNnA6lUWA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/Df8AD2cAn/0UlkrrXSnlDaINfvql5OcdYHgaHusC2g0mPgpe
	Zl1dse4fkUg0hQ38B5D/cTdL0b7F1f2tCnTDBzWg+9cAM3Afko0lD+A5ms787fWO1gUy7Z2+rAe
	kRFMuxUSJbRJD7gpA7IHKhA2tSuvwfL5zoTukzQCbiSYZbIz5A/eZu244LYOvxYYi
X-Gm-Gg: AZuq6aICq2QAgGt266UitXyZFVqjAGPyuEnKpQUw8dy4cZrFvKhsEvgUcOp8dfNe8wT
	Zp4beDsrRFkH9MWn5eF+bZaTRmTkOxmI90xxC9oFiLpjTlYf7R0ZKsvUlwdnMx0LwtLCyBjej4W
	02ejTfDAiaFFl7EFgOWR9xpJ3U0Xx4YpC4I3LifVlcRoMjzi2q1mt5+0/OdGcjwISQ9ZcYppLFd
	mDCV3iLI+i+MP9N1pzbbi6RuIMYi/vBYc3uG/ljsq5FK/Y7dUYlLzwSXZI1/8MQFKHuI87RnPdj
	XFl+Z2SbFzaLmV5hQ6phwOBxyW2ivoYPl4vG4Oy2AQm9A1xZmQhVxlqp5OE6sa2BxY+tsC3dlDw
	nnaXvONGA
X-Received: by 2002:a05:6214:1c4c:b0:894:6da3:219e with SMTP id 6a1803df08f44-894dfb2fc42mr12642526d6.25.1769633303094;
        Wed, 28 Jan 2026 12:48:23 -0800 (PST)
X-Received: by 2002:a05:6214:1c4c:b0:894:6da3:219e with SMTP id 6a1803df08f44-894dfb2fc42mr12642106d6.25.1769633302582;
        Wed, 28 Jan 2026 12:48:22 -0800 (PST)
Received: from localhost ([2607:f2c0:b0bc:f100:e97:de30:9768:6518])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-894d375debasm24038726d6.42.2026.01.28.12.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:48:22 -0800 (PST)
Date: Wed, 28 Jan 2026 15:48:21 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: Re: [REGRESSION] drm/amd/display: Add an hdmi_hpd_debounce_delay_ms
 module
Message-ID: <aXp2FRLJh-7Q6TxS@earendel>
Mail-Followup-To: Alex Deucher <alexdeucher@gmail.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
	Ivan Lipski <ivan.lipski@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
References: <aXptBPF3L07zJB1O@earendel>
 <CADnq5_OqFEi_ML9zR-i_WFtFmBBQQcbQNRAiP8pVdD+prvEoiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CADnq5_OqFEi_ML9zR-i_WFtFmBBQQcbQNRAiP8pVdD+prvEoiQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nKvDGvdd504BYtO51xBYA-s-f0iupGmN_5PVnAqM2pk_1769633303
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jan 28, 2026 at 03:17:18PM -0500, Alex Deucher wrote:
> On Wed, Jan 28, 2026 at 3:09 PM Peter Colberg <pcolberg@redhat.com> wrote:
> >
> > Hi,
> >
> > I hit a regression introduced as part of v6.19-rc6 (and still present
> > in v6.19-rc7), where, upon unloading the amdgpu module, __flush_work()
> > is passed a work struct with the work function set to NULL. The issue
> > is seen with an AMD Radeon Pro W7900, but not an AMD Instinct MI210.
> 
> I think this should be fixed in:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/17b2c526fd8026d8e0f4c0e7f94fc517e3901589

That fix applied to v6.19-rc7 does indeed resolve the issue.

Thank you for the pointer and apologies for the noise.

Peter

