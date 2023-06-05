Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8514156DE
	for <regressions@lists.linux.dev>; Mon,  5 Jun 2023 10:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5688EC433D2;
	Mon,  5 Jun 2023 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685960316;
	bh=Hq8WndsreVnOiOjWNynVMw7xnDT/MtLrF7deKaysJyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQLZ2VOLsMuWSk++nBuN3rvjtATWL1sX0YGhAbM+V5HxQYe1amB08X1j9iqJxe7dr
	 Y9pTagR5YP1J3TRQd+RTL3sfcoD64Tvi0yftaUlrEIzIuKHAhdcjWFl1xacDxw28w4
	 auoGQnW9QZZzfQyrEiGgRKNRCpbpk/fy2mJ6y1dcQd0JD+UdIa2u2P3LsmTZMNZ5Kd
	 QMF0fMMQiLnYF/i/MD1ytI/U0IgVOgU6VSbThlwv9Ag/30ezJZpu8L/qDUkHUj7MH9
	 aBXAxCwBvotTh1AUffkttQmmAAmBRa8IHgPeGYQJDTPmDHj3esC37gMv0hoCsVGHfv
	 uyp1cE8FRS6KA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1q67Ia-0005sI-Uo; Mon, 05 Jun 2023 12:18:53 +0200
Date: Mon, 5 Jun 2023 12:18:52 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Vinod Polimera <quic_vpolimer@quicinc.com>,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "drm/msm/dp: set self refresh aware based on PSR
 support"
Message-ID: <ZH22jMTq6fi8iBpe@hovoldconsulting.com>
References: <20230523151646.28366-1-johan+linaro@kernel.org>
 <ZH2ys6dVeL02JLCU@hovoldconsulting.com>
 <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJprBNzw4o4m0sn2OoOqnwioQWNcTPcKoKGqxLWGc_8xjWA@mail.gmail.com>

On Mon, Jun 05, 2023 at 01:05:36PM +0300, Dmitry Baryshkov wrote:
> On Mon, 5 Jun 2023 at 13:02, Johan Hovold <johan@kernel.org> wrote:

> > Virtual terminals are still broken with 6.4-rc5 on the Lenovo ThinkPad
> > X13s two weeks after I reported this, and there has been no indication
> > of any progress in the other related thread:
> >
> >         https://lore.kernel.org/lkml/ZHYPHnWoDbXB-fqe@hovoldconsulting.com
> >
> > Seems like it is time to merge this revert to get this sorted.
> >
> > Rob, Abhinav, Dmitry, can either of you merge this one and get it into
> > 6.4-rc6?
> 
> Rob sent the pull request few hours ago, see
> https://lore.kernel.org/dri-devel/CAF6AEGuHujkFjRa6ys36Uyh0KUr4Hd16u1EMqJo8tOZ3ifVubQ@mail.gmail.com/

Ok, so you guys went with the module parameter hack. Whatever. As long
as the regression is finally fixed.

Next time, some visibility into your process would be appreciated to
avoid unnecessary work.

Johan
