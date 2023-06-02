Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72D1C758
	for <regressions@lists.linux.dev>; Fri,  2 Jun 2023 16:12:53 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-651f2f38634so1699663b3a.0
        for <regressions@lists.linux.dev>; Fri, 02 Jun 2023 09:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685722373; x=1688314373;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhmHRyToIEmAAHnN/IwEZChyqNOsrqiKFOCxgESTvfk=;
        b=QNqMgXaW84FsS8Ck/A01cCxyIWV84qC3tILHwN+hr/GzQjLA0wd4t3wXIVaxYnnxel
         QsT4pQmmRs/82EGyBEjvl94cgJTi3sOXjQB2iLGWt1WQs1TBs9j4LwGPQXzSjhslTuvP
         XQro5oj1YkzyXdWiiMjhuiDZXpvOAW/kQZZQMF40e/RV3z0hfv5SviuOyehzWw1v9ukb
         7UhpStmtLpjLFSg0Qm8wyYbYAhRqsipubfh6crqw4nMyRS4VGrnugWgxzJJM7EvaWFm0
         x2GSwpX8E/GVTQSbsWMMeE8g5CnvJ8IwbvzumguJQMI7Ut2qSuoWkWa27rtR5myWANlB
         fWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685722373; x=1688314373;
        h=content-transfer-encoding:author:mime-version:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xhmHRyToIEmAAHnN/IwEZChyqNOsrqiKFOCxgESTvfk=;
        b=RdOXuck9wd45rW5xxJHjteinOJ8RfiVUM6ChXBAt1jqwOst2ejzSif19Y/6ds11EfM
         rNLM0Mugi+wjCTZBeDrmaiU0aRnLwpgiCaYMJGJ4Epq5E9mvQJVzmb9vhhIQaQvQNhf9
         MBOGZuq5jouzB7NrFFBHiOMOZPAnot/laWskIdW+q3OVNPvOkMAmeXPo+nFEedldcEMP
         6gE9CUdMY0GfGm7Z2vQ/gDmB64jnrjsZPuzX1mAPfymmGyFdZcLq1RJzHk9IbK7CI3cL
         /m1Fz0+lcoSgIT6GAlHVTEYOeVZbwhlvxK38P9qm5APhnFVcvj9lpXV4NkbbVVfkR5aN
         Xs1g==
X-Gm-Message-State: AC+VfDznID59b3Gjm2vgKpRQev7x8OQOao7ct4c6nPY4iB5SLCFbhdiQ
	pWBSS0Qg6VoPl+Mxa/A9WCLjBA==
X-Google-Smtp-Source: ACHHUZ6oiEWSgd6EGNqsh+9/KWnn2XOtzx0RThiCm670UWl9NCNn/53nT/5blXc9/ZCXPcNFLV+mLg==
X-Received: by 2002:a05:6a00:15c7:b0:646:6cc3:4a52 with SMTP id o7-20020a056a0015c700b006466cc34a52mr16570169pfu.3.1685722373382;
        Fri, 02 Jun 2023 09:12:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.50.231])
        by smtp.gmail.com with ESMTPSA id 9-20020aa79149000000b00652a72b89d1sm1197014pfi.170.2023.06.02.09.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 09:12:52 -0700 (PDT)
From: Amit Pundir <amit.pundir@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: regressions <regressions@lists.linux.dev>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	dt <devicetree@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: sdm845-db845c: Move LVS regulator nodes up
Date: Fri,  2 Jun 2023 21:42:46 +0530
Message-Id: <20230602161246.1855448-1-amit.pundir@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author: Amit Pundir <amit.pundir@linaro.org>
Content-Transfer-Encoding: 8bit

Move lvs1 and lvs2 regulator nodes up in the rpmh-regulators
list to workaround a boot regression uncovered by the upstream
commit ad44ac082fdf ("regulator: qcom-rpmh: Revert "regulator:
qcom-rpmh: Use PROBE_FORCE_SYNCHRONOUS"").

Without this fix DB845c fail to boot at times because one of the
lvs1 or lvs2 regulators fail to turn ON in time.

Link: https://lore.kernel.org/all/CAMi1Hd1avQDcDQf137m2auz2znov4XL8YGrLZsw5edb-NtRJRw@mail.gmail.com/
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index e14fe9bbb386..df2fde9063dc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -301,6 +301,18 @@ regulators-0 {
 		vdd-l26-supply = <&vreg_s3a_1p35>;
 		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
 
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
 		vreg_s3a_1p35: smps3 {
 			regulator-min-microvolt = <1352000>;
 			regulator-max-microvolt = <1352000>;
@@ -381,18 +393,6 @@ vreg_l26a_1p2: ldo26 {
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
-
-		vreg_lvs1a_1p8: lvs1 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
-
-		vreg_lvs2a_1p8: lvs2 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
 	};
 
 	regulators-1 {
-- 
2.25.1

