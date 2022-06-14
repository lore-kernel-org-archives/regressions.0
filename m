Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7381FC1
	for <regressions@lists.linux.dev>; Tue, 14 Jun 2022 18:59:17 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1011df6971aso11234538fac.1
        for <regressions@lists.linux.dev>; Tue, 14 Jun 2022 11:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7DJFpFT+M61LIr/9pPfEsAsFGxGe0TN/S/etgDHxSFw=;
        b=EhyzX8MfEVQrY1J5uG3TqHkItFq7RUdBTTu4YiXHumh77C60+AN46qdoP1DHcTds+x
         BFQ3MZw3nJ4+b/g+l8Pkg4jaDydh/AtnYQtPJtSeEQsNs5QB0rEx2DBmZ4BR9ZD7/Dna
         Vz3+vyN5FvzlNjumxodJXcjlMsipsQvinAAzHBKo9xbiiajcV4g4BM6zWnvF1K4YQKWO
         MjTgncCkQtNbwnHsJxBIO+oiZmdVWmbjbLtEfSJBSNM1/wwMvoTGHEYzFM4xa+DzpCwA
         0o16jtAIOpOxvbKaX9CiPrFXQKYuo/QvzJGGlMl+XF5weKQMe3TDl8g3EMmX9GifM3ga
         ISKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7DJFpFT+M61LIr/9pPfEsAsFGxGe0TN/S/etgDHxSFw=;
        b=e3r0I8OrUAIPnxAGuc5upLwEbsetbCh8Rar3W18y8H3jvUPHwDvA3dgW6H2qfq/UHu
         COnHJCghKdLYqBx0QSDR/kx8Kfo2Y1f5QW4ozLFfYVPpuaanj4mA3h9hOOUsKSdLo98d
         QE8VCr54wyGxXwAnYVeSrAuiFCRG90NQyBjOVnXf6HtFKAHWusjJK4ZIyy8IsTX6CmGv
         gjJ3riYXgY2MSNcwpJxhnFIx7aXTD7QPhghdr7R2XTmt/14xeFQMZ9aaGM3yfjazrAHZ
         DXjRlqvvxcE4Bq/Dd53xQNa1hw8kPDOOL3PjgMA9Mu0QC5cs7AyZFJQFi0Uo3hppZ/My
         LoWw==
X-Gm-Message-State: AJIora8hLi3Qh+4YF1cG1JwLYzUlGFASxUi/po1p2wGs2evwx3RX8Y5E
	gxEtYlem990Qbxr1TNWam2H1M4G+j4T9/pihap0=
X-Google-Smtp-Source: AGRyM1vpg8ip2LF9MucxZz/Co1+sh3TZk/FknJqF+2EP4UwvEqP6a5z6gJzKq7AsRvWxDCqweUPRtn7Ias1tIMOk15s=
X-Received: by 2002:a05:6870:b153:b0:f8:7602:8408 with SMTP id
 a19-20020a056870b15300b000f876028408mr3269559oal.73.1655233156100; Tue, 14
 Jun 2022 11:59:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <e58125a4-f885-ae55-0441-d52ecab9a1e8@gmail.com> <20220614000052.GA727153@bhelgaas>
In-Reply-To: <20220614000052.GA727153@bhelgaas>
From: Jim Quinlan <jim2101024@gmail.com>
Date: Tue, 14 Jun 2022 14:59:02 -0400
Message-ID: <CANCKTBtgZoXZikHVoLUVLGk04dzXYzdi-vdD-xaHnt0Z3BD45Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] PCI: brcmstb: Revert subdevice regulator stuff
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Cyril Brulebois <kibi@debian.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	linux-pci <linux-pci@vger.kernel.org>, regressions@lists.linux.dev, 
	Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 13, 2022 at 8:00 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Mon, Jun 13, 2022 at 10:06:12AM -0700, Florian Fainelli wrote:
> > On 5/11/22 13:39, Bjorn Helgaas wrote:
> > > On Wed, May 11, 2022 at 01:24:55PM -0700, Florian Fainelli wrote:
> > > > On 5/11/22 13:18, Bjorn Helgaas wrote:
> > > > > From: Bjorn Helgaas <bhelgaas@google.com>
> > > > >
> > > > > Cyril reported that 830aa6f29f07 ("PCI: brcmstb: Split brcm_pcie_setup()
> > > > > into two funcs"), which appeared in v5.17-rc1, broke booting on the
> > > > > Raspberry Pi Compute Module 4.  Revert 830aa6f29f07 and subsequent patches
> > > > > for now.
> > > >
> > > > How about we get a chance to fix this? Where, when and how was this even
> > > > reported?
> > >
> > > Sorry, I forgot to cc you, that's my fault:
> > >    https://lore.kernel.org/r/CABhMZUWjZCwK1_qT2ghTSu2dguJBzBTpiTqKohyA72OSGMsaeg@mail.gmail.com
> > >
> > > If you come up with a fix, I'll drop the reverts, of course.
>
> > What is even better is that meanwhile there was already a candidate fix
> > proposed on May 18th, and a v2 on May 28th, so still an alternative to the
> > reverts making it to Linus' tree, or so I thought.
>
> I hoped for a fix, but neither of those seemed to be clearly better.
>
> > - the history for pcie-brcmstb.c is now looking super ugly because we have 4
> > commits getting reverted and if we were to add back the original feature
> > being added now what? Do we come up with reverts of reverts, or the modified
> > (with the fix) original commits applied on top, are not we going to sign
> > ourselves for another 13 or so round of patches before we all agree on the
> > solution?
>
> I agree on the ugliness and I try hard to avoid that.  In this case I
> waited too long after the regression was discovered, hoping for a fix
> that was better than the revert.  And I should have asked for
> trade-offs between the revert and the the CM4 regression.
>
> > - we could have just fixed this with proper communication from the get go
> > about the regression in the first place, which remains the failure in
> > communicating appropriately with driver authors/maintainers
>
> I apologized earlier for omitting you when the regression was
> discovered, and I'm still sorry.
>
> > I appreciate that as a maintainer you are very sensitive to regressions and
> > want to be responsive and responsible but this is not leaving just a
> > slightest chance to right a wrong. Can we not do that again please?
>
> Cyril opened the bugzilla April 30 and I forwarded it to linux-pci and
> to Jim (but not you; again, I'm sorry for that omission) on May 2.
> From my perspective we had almost a month to push this forward, but we
> didn't quite make it.
Hello Bjorn,

Can you elaborate this? On May 18 I submitted v1, a viable fix.
At no point did you say "you need to get v2 in ASAP because I am planning on
reverting the entire original patchset in N days".  If I had known
this was the situation,
I could have had you a v2 on May 19th, but as it was I let the v1
email review thread
die out before submitting v2.

The original patchset was and is controversial, as it is basically a square peg
that does not fit nicely into a round Linux hole. It took 11 versions
of following reviewers'
suggestions until it was accepted.  And now it has been reverted, I am
wondering if it will ever be let in again or whether I should even try.

Regards,
Jim Quinlan
Broadcom STB


>
> I posted the reverts May 11, but I did not realize the regression to
> you and other users they would cause.  I apologize for that.
>
> Bjorn
