Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784C020822B
	for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731403267; cv=none; b=WkWlVURjprBv3Klq2NxulchJG2h+MX1VzXaE6BF+fe2N2SoiOv4evFAmDbi8281gninCie7IpAg4qdNXlo6WcP2sYQfOOD37Y7egIILTb0wxINwGGif1KukHBXPN1jE5/GBEz7TtlWw0PNlLpXxRm0tI5w1rPOaK6doKlo1fwD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731403267; c=relaxed/simple;
	bh=X0nkcWscmQlrmf+TLY0Wg9gFcUpK0Cen4YMwGoVDmeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQB1DX9S2DC0nuFdpeAtg0BbO9pK+g9ItuD235vrU6Oxx9Y28HEg/jWYDPlXO7hc7tUaQ7KA7tJo5xKzN6DRLv+4W2sAB0EhhNwsAsHSo2pfhcEhOvUGNshsy1gCYDfQ/NOdxfumz0PW8EZTLM0hnEl3+qlrptK7Dnbzw7de0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=NSPJ3oVX; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="NSPJ3oVX"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 8714F1FA05;
	Tue, 12 Nov 2024 10:20:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1731403259;
	bh=nqTjLk1zD6oeEo+651Nbriswu6CCF85fypmhG0chddQ=; h=From:To:Subject;
	b=NSPJ3oVXgNMobw7T+l2Hku9TkGxCiTqJdgAI4bhJFLR+/7GBaNWzVcJc2OHxi+jhd
	 eS5NBfYRXfeB/c4L1T8+1iI7/DOR0QzWps2Dar7yw/mR8VebEwukyu+zKkKLy/a19Y
	 lj4ISO32bml8ylATCB8ThOn2GRpHZoPqiFjxohKUFRseWRksJWfZDlif7iIl/+nW0u
	 UdpbMzg+paTWriTKQw+FePelFAPwZ6WO0BG5+DqbD1qxvovo4EtrsFGo3HTZw1EyCD
	 D55R9dwj/KQaeCimXmeqqjDxWoFRN15B9HJelZY5soybi4pkkq0Jh1URdKnU731rgm
	 TXWjYwdLln1SQ==
Date: Tue, 12 Nov 2024 10:20:54 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, shengjiu.wang@gmail.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>, ulf.hansson@linaro.org
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on
 v6.12
Message-ID: <20241112092054.GA18139@francesco-nb>
References: <20241007132555.GA53279@francesco-nb>
 <20241112075958.GA8092@francesco-nb>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112075958.GA8092@francesco-nb>

On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote:
> On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wrote:
> > it seems that an old regression is back on v6.12, reproduced on -rc2
> > (not sure about rc1).
> > 
> > The original report is from https://lore.kernel.org/all/20240424164725.GA18760@francesco-nb/
> > and it was fixed with https://lore.kernel.org/all/1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com/.
> > 
> > Is it now back?
> 
> I was able to reproduce this issue once more, this time with 6.11.7.
> As I wrote in another email the issue is not systematic as it used to
> be.
> 
> Any idea?

Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_up() is
too short and therefore we have such non-systematic failures?

Francesco

