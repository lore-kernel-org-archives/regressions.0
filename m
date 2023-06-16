Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EA818C07
	for <regressions@lists.linux.dev>; Fri, 16 Jun 2023 17:10:25 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-62fe188255eso5444516d6.0
        for <regressions@lists.linux.dev>; Fri, 16 Jun 2023 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686935424; x=1689527424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=13Ub72LeNXocacDH8iq4dsRSC3PCfVbZC0BT5ktGknQ=;
        b=K2++xF6Vx0ws0J6uj4X1wisvjM3l1xIveAWOl4e8+ZmaBcxl2KJFMRX1zv2Ry7JpzG
         9+2RZsQY1ijumTVgctdxPIY1c0QMyWbastHlS0wIXF4T2df1S883+ivLHJbbO+WPr6/T
         u1kl9G4+vq+KnRvA6kTpb+e9d26pE90sUOQjvp/OlBAy/CbbHrZ+KTRRPX2x2y3KzkWE
         EpPedQJfPjWcRF5aRfx/5CIvpy1hNquop+wtUSRpk5oWBvzEX5lxD1xIBbQusErwtAq+
         ns64wLHnszc2Q7Smw/uCWh1uRgT4y41L+S95OJXE15WYXJltPvllZ6SroP5bgIwTUPnL
         LsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686935424; x=1689527424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13Ub72LeNXocacDH8iq4dsRSC3PCfVbZC0BT5ktGknQ=;
        b=gGWO7urfbLxiG22cr58Bnweti4g1SI3PxLemYIs6/3U+1X8KQKnzx1xsdqjunmLyQs
         GHFmu65BqDa2PlQ1XIgriW0KH7vopILGrMD0Fd2RBpB4HHc3jjMxj6/jBCQaATYbu2EC
         l10L9s9fW1TFD3ryRSIGoPG4RVpYgGe/bZc1vF6QB0ldW1Oq8yghwbx3IYNwr9elYWRa
         VPP1DFPAF4JQx75a4T8/LMwZx7Dy/WOzR7HhdzLtEZoum4z7dR/zuOpW97KiMf3NSXb9
         T2c/3X594iX22DpjxfsjJRB/bA2Laqam7UYWVXYZ4eEB99vz82yZer4deCPCBXCe4lKl
         4Ipw==
X-Gm-Message-State: AC+VfDxKxv0sUMkinvLQKhTFpEloW5DkV5iL+rbN26EQV6DS0HqQ8SiY
	S6nRQJ4CbBh1fd1giPPiPDhkzhYlsmKEyvvATqiouQ==
X-Google-Smtp-Source: ACHHUZ6lpFZ09A9IHX3P4ygHt4+nMALCSy4x/x3LBageSe+7wXjEyTwO2TPHfFUg00vHZLl+yvNChqtDn2H/xoOW7GA=
X-Received: by 2002:a05:6214:1c0a:b0:62d:ddeb:3770 with SMTP id
 u10-20020a0562141c0a00b0062dddeb3770mr8653889qvc.0.1686935424170; Fri, 16 Jun
 2023 10:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
 <358c69ad-fa8a-7386-fe75-92369883ee48@leemhuis.info> <0f6c9dcb-b7f6-fff9-6bed-f4585ea8e487@linaro.org>
 <CAMi1Hd3Cv1i06NhpY6Jqu7OvMpOdzTj6nTEMJNWLrMwMLsugZA@mail.gmail.com>
 <CAMi1Hd0=KV7k82ARadF45nqX+Cv6zPLCxfDvOyAPeXiFd8jpVA@mail.gmail.com>
 <0ec6c988-d678-c96c-a7a2-af38e6701404@linaro.org> <CAMi1Hd33_Ccxkf9C5_QBO3tvOZcGnYh+_CKcACUtoY2qAuOzRA@mail.gmail.com>
 <12d6b687-5e5a-bd7c-ff5c-007a74753edb@linaro.org>
In-Reply-To: <12d6b687-5e5a-bd7c-ff5c-007a74753edb@linaro.org>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Fri, 16 Jun 2023 22:39:47 +0530
Message-ID: <CAMi1Hd2H2aA6EYp5-46dWe0eu0_hAWUumoQbnk7WR0q9bhppog@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Mark Brown <broonie@kernel.org>, 
	Doug Anderson <dianders@chromium.org>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, dt <devicetree@vger.kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, 16 Jun 2023 at 13:57, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
>
> So you have interconnect as module - this is not a supported setup. It
> might work with if all the modules are loaded very early or might not.
> Pinctrl is another driver which should be built-in.
>
> With your defconfig I see regular issue - console and system dies
> because of lack of interconnects, most likely. I don't see your WARNs -
> I just see usual hang.
>
> See:
> https://lore.kernel.org/all/20221021032702.1340963-1-krzysztof.kozlowski@linaro.org/
>
> If you want them to really be modules, then you need to fix all the
> dependencies (SOFTDEP?), probe ordering glitches. It's not a problem of
> DTS. Just because something can be built as module, does not mean it
> will work. We don't test it, we don't work with them as modules.

I do somewhat agree with most of your arguments but not this one. If a
driver doesn't work as a module then it shouldn't be allowed to build
as a module. I took a quick look at the history of the interconnect
driver and it is tristate from the beginning. And not converted to a
modular build later-on like some of the other drivers to support GKI.

>
> It's kind of the same as here:
> https://lore.kernel.org/all/ac328b6a-a8e2-873d-4015-814cb4f5588e@canonical.com/
>
> I understand that we might have here regression, if these were working
> as modules, but I don't think we ever really committed to it. We can as
> well make it non-module to solve the regression.

Sure. But since v6.4 is around the corner, can we merge this
workaround for now, while a proper fix is being worked upon.

Regards,
Amit Pundir
