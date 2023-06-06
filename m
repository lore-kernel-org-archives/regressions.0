Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B727E4
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 23:34:29 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-75d44cb20a2so352468485a.3
        for <regressions@lists.linux.dev>; Tue, 06 Jun 2023 16:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686094467; x=1688686467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGFunOEezrTgCZyEfU8nDw4x9+xyVAO+9lV0ZlJ/tsM=;
        b=aIIdSuUb2lShLzTPkjkRYJNpXx8wNHZAViCIk/E667aaZN4RiKXosRzUudYt9nkbSy
         crb8/ehD3wpdygC5ga7vjt34LKh3VFUoJrufbukQ99L7mt2bWgfyy+l5iH1mgVbm5WyO
         UMcBS3kNoUBdRXX7WT2uXX2LZeG8ebi+Ty+6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686094467; x=1688686467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGFunOEezrTgCZyEfU8nDw4x9+xyVAO+9lV0ZlJ/tsM=;
        b=NGzt22uk8edqFH6UwBmR08AVX6ftpHrvtMyjLmoL1rByR49zcV3deSgpmUfMa+Gf2/
         gDhut5m9pAmMzaT2udHKfIqO+nizIgllEKqgXcL91PII9D27v5+Ug8Uc+pgRwzOjOKXG
         PL6tJ6afDBiiAXGjHbzxQCNlgSV+nVl/xsbS6CWXvGSnVJ+ZuubSzkwlgzoiLSMhXhoS
         TOOTspavArRr9vOLDhXyjTrv2Kato3WeIgXt7j2p8jx8mKWUeSJmWNpV4/H2B0Q9qgVZ
         TvFY0+NRZhNsloLNsNRJq+tbUAIvCyhCIkLuPCIMqgie81LlEK1AVXlVSDST93nVCBz/
         hcSQ==
X-Gm-Message-State: AC+VfDwP0T+kgl3zBm8bGqTrOsJn47K3TDGoDIdK6lrigQhhSQvFroB+
	rj9BjHf/5skiOLiZ8MoL9ofB24WJXLac7f1y/NA=
X-Google-Smtp-Source: ACHHUZ7SpBlUspy2JHlg9UmLh+GpsyqNg1ZTVWLvUpzc3WPqDl8pKsPpQXpcZ0LwhGi9iXQZijwXJA==
X-Received: by 2002:a05:620a:b13:b0:75d:5445:6afe with SMTP id t19-20020a05620a0b1300b0075d54456afemr142268qkg.58.1686094467121;
        Tue, 06 Jun 2023 16:34:27 -0700 (PDT)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b0075b27186d9asm5237630qkl.106.2023.06.06.16.34.24
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 16:34:25 -0700 (PDT)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-3f9a81da5d7so93351cf.0
        for <regressions@lists.linux.dev>; Tue, 06 Jun 2023 16:34:24 -0700 (PDT)
X-Received: by 2002:a05:622a:547:b0:3f8:1a01:e933 with SMTP id
 m7-20020a05622a054700b003f81a01e933mr67672qtx.24.1686094464496; Tue, 06 Jun
 2023 16:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230602161246.1855448-1-amit.pundir@linaro.org>
In-Reply-To: <20230602161246.1855448-1-amit.pundir@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 6 Jun 2023 16:34:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9xwxC4+wDYFMSoLWaj8vaLH_jettZ=nxEZP+1tNk=oA@mail.gmail.com>
Message-ID: <CAD=FV=U9xwxC4+wDYFMSoLWaj8vaLH_jettZ=nxEZP+1tNk=oA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	regressions <regressions@lists.linux.dev>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	dt <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 2, 2023 at 9:12=E2=80=AFAM Amit Pundir <amit.pundir@linaro.org>=
 wrote:
>
> Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
> list to workaround a boot regression uncovered by the upstream
> commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
> qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").
>
> Without this fix DB845c fail to boot at times because one of the
> lvs1 or lvs2 regulators fail to turn ON in time.
>
> Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZs=
w5edb-NtRJRw@mail.gmail.com/
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 24 +++++++++++-----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot=
/dts/qcom/sdm845-db845c.dts
> index e14fe9bbb386..df2fde9063dc 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -301,6 +301,18 @@ regulators-0 {
>                 vdd-l26-supply =3D <&vreg_s3a_1p35>;
>                 vin-lvs-1-2-supply =3D <&vreg_s4a_1p8>;
>
> +               vreg_lvs1a_1p8: lvs1 {
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-always-on;
> +               };
> +
> +               vreg_lvs2a_1p8: lvs2 {
> +                       regulator-min-microvolt =3D <1800000>;
> +                       regulator-max-microvolt =3D <1800000>;
> +                       regulator-always-on;
> +               };
> +
>                 vreg_s3a_1p35: smps3 {
>                         regulator-min-microvolt =3D <1352000>;
>                         regulator-max-microvolt =3D <1352000>;
> @@ -381,18 +393,6 @@ vreg_l26a_1p2: ldo26 {
>                         regulator-max-microvolt =3D <1200000>;
>                         regulator-initial-mode =3D <RPMH_REGULATOR_MODE_H=
PM>;
>                 };
> -
> -               vreg_lvs1a_1p8: lvs1 {
> -                       regulator-min-microvolt =3D <1800000>;
> -                       regulator-max-microvolt =3D <1800000>;
> -                       regulator-always-on;
> -               };
> -
> -               vreg_lvs2a_1p8: lvs2 {
> -                       regulator-min-microvolt =3D <1800000>;
> -                       regulator-max-microvolt =3D <1800000>;
> -                       regulator-always-on;
> -               };

This is a hack, but it at least feels less bad than reverting the
async probe patch. I'll leave it to Bjorn to decide if he's OK with
it. Personally, it feels like this would deserve a comment in the dts
to document that these regulators need to be listed first.

Ideally, we could still work towards a root cause. I added a few more
ideas to help with root causing in reply to the original thread about
this.

https://lore.kernel.org/r/CAD=3DFV=3DUKyjRNZG-ED2meUAR9aXdco+AbUTHiKixTzjCk=
aJbjTg@mail.gmail.com/

-Doug
