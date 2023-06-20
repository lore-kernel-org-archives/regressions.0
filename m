Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B349F1078E
	for <regressions@lists.linux.dev>; Tue, 20 Jun 2023 15:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFB9C433C8;
	Tue, 20 Jun 2023 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687276549;
	bh=ZKPHxEnSu+t4Ow41QVyBNgZ7aWHN6jZsT83hXkppoig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kkZSjN+RB5K4RrVgDbyYdR0uGWYdE+0CEqmZd3AFdHO0rOZyJYWI1w5rKZOqsMS+r
	 jPfpBGLLGg6plRC5o8b0Y7C48hXJkXtXyHyggalNHYeIg9D/EHEDcovKPliZ3Y1L2W
	 ozq9z7ert0fEM6zU4jhrBxC/ctp9GKrMMeLbebWTQZ6MmOt0spZm6bi1XWDhRMDODj
	 vZi613LD4+xdZNlIowKvPWteH6STHkGnCylKpMPSreNNeOfqQkz3CW9eVVcVkwwfu9
	 iPiyxT0mGWaPf5cHmcYZJJCRVv6FXasjpLhrBldgpEktQOHB7vDgZLCCNO5d2jsf0e
	 BOBFZwzgh5DcA==
Date: Tue, 20 Jun 2023 08:59:02 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Amit Pundir <amit.pundir@linaro.org>,
	Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	dt <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator
 nodes up
Message-ID: <20230620155902.clspxncyvpodixft@ripper>
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info>
 <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
 <CAD=FV=Xt2KYGY15+f+nHxkzKnwhHzw1A7=o+5kgCDWvHDv0DNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Xt2KYGY15+f+nHxkzKnwhHzw1A7=o+5kgCDWvHDv0DNg@mail.gmail.com>

On Wed, Jun 14, 2023 at 12:44:15PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 14, 2023 at 11:47 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >
> > On 14/06/2023 20:18, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > On 02.06.23 18:12, Amit Pundir wrote:
> > >> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
> > >> list to workaround a boot regression uncovered by the upstream
> > >> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
> > >> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
> > >>
> > >> Without this fix DB845c fail to boot at times because one of the
> > >> lvs1 or lvs2 regulators fail to turn ON in time.
> > >
> > > /me waves friendly
> > >
> > > FWIW, as it's not obvious: this...
> > >
> > >> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
> > >
> > > ...is a report about a regression. One that we could still solve before
> > > 6.4 is out. One I'll likely will point Linus to, unless a fix comes into
> > > sight.
> > >
> > > When I noticed the reluctant replies to this patch I earlier today asked
> > > in the thread with the report what the plan forward was:
> > > https://lore.kernel.org/all/CAD%3DFV%3DV-h4EUKHCM9UivsFHRsJPY5sAiwXV3a1hUX9DUMkkxdg@mail.gmail.com/
> > >
> > > Dough there replied:
> > >
> > > ```
> > > Of the two proposals made (the revert vs. the reordering of the dts),
> > > the reordering of the dts seems better. It only affects the one buggy
> > > board (rather than preventing us to move to async probe for everyone)
> > > and it also has a chance of actually fixing something (changing the
> > > order that regulators probe in rpmh-regulator might legitimately work
> > > around the problem). That being said, just like the revert the dts
> > > reordering is still just papering over the problem and is fragile /
> > > not guaranteed to work forever.
> > > ```
> > >
> > > Papering over obviously is not good, but has anyone a better idea to fix
> > > this? Or is "not fixing" for some reason an viable option here?
> > >
> >
> > I understand there is a regression, although kernel is not mainline
> > (hash df7443a96851 is unknown) and the only solutions were papering the
> > problem. Reverting commit is a temporary workaround. Moving nodes in DTS
> > is not acceptable because it hides actual problem and only solves this
> > one particular observed problem, while actual issue is still there. It
> > would be nice to be able to reproduce it on real mainline with normal
> > operating system (not AOSP) - with ramdiks/without/whatever. So far no
> > one did it, right?
> 
> The worry I have about the revert here is that it will never be able
> to be undone and that doesn't seem great long term. I'm all for a
> temporary revert to fix a problem while the root cause is understood,
> but in this case I have a hard time believing that we'll make more
> progress towards a root cause once the revert lands. All the
> investigation we've done so far seems to indicate that the revert only
> fixes the problem by luck...
> 
> I completely agree that moving the nodes in the DTS is a hack and just
> hides the problem. However, it also at least limits the workaround to
> the one board showing the problem and doesn't mean we're stuck with
> synchronous probe for rpmh-regulator for all eternity because nobody
> can understand this timing issue on db845c.
> 

I agree that we shouldn't hide this by reverting the regulator change.


And as has been stated a few times already, the symptom indicates that
we have a misconfigured system.

Before accepting a patch just shuffling the bricks, I'd like to see some
more analysis of what happens wrt the rpmh right before the timeout.
Perhaps the landing team can assist here?

Regards,
Bjorn
