Received: from smart6-pmg.ufmg.br (smart6-03-pmg.ufmg.br [150.164.64.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614832564
	for <regressions@lists.linux.dev>; Sun, 13 Aug 2023 17:22:55 +0000 (UTC)
Received: from smart6-pmg.ufmg.br (localhost.localdomain [127.0.0.1])
	by smart6-pmg.ufmg.br (Proxmox) with ESMTP id 91CF478FC14
	for <regressions@lists.linux.dev>; Sun, 13 Aug 2023 08:23:26 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eba.ufmg.br; h=
	cc:content-transfer-encoding:content-type:content-type:date:from
	:from:message-id:mime-version:reply-to:reply-to:subject:subject
	:to:to; s=mail; bh=SKFdmCtdhQrRnzjy1nADScInWwiji3n0DHT8UpP2Mug=; b=
	bBztrYtVolcqjtTRzB59alFb4P0OO6Cqa32jl1YRdMdEfnqBQvWgRHCLaKdW0Y6x
	IU/xQAQO866BVSbX9YAO65pJQekwFABbSLZbtLAxEbZgl1qVX+xxhwBK2fYD9AVx
	u/a3acypXAUolxIdlYTP62/76Ke6I8FQWuUfzmjJgxn/ip4ACUqSr971b6G2Z/0Z
	fF80WOWSuKzcrCF1NjKe/KxQVAH5BgBLV6t50YyJ69w+bFqcnoUonuCTE1LbgIAw
	D5Z5qXTkeh9f0idDblm9AdbakjwMSvvPp5K+0nq0YBUFOPjHr8TbltDSTKNUWoR9
	kicji1LXxa5q4lhKEBGSpg==
Received: from carretel.grude.ufmg.br (carretel.grude.ufmg.br [150.164.64.36])
	by smart6-pmg.ufmg.br (Proxmox) with ESMTP id 1ABB17948F7
	for <regressions@lists.linux.dev>; Sun, 13 Aug 2023 07:54:27 -0300 (-03)
Received: from eba.ufmg.br ([98.159.234.84])
          by carretel.grude.ufmg.br (IBM Domino Release 10.0.1FP3)
          with ESMTP id 2023081307351457-169132 ;
          Sun, 13 Aug 2023 07:35:14 -0300 
Reply-To: "Kristine Wellenstein" <dianedavis@impactfinancialgroupinc.com>
From: "Kristine Wellenstein" <hildebrando@eba.ufmg.br>
To: regressions@lists.linux.dev
Subject: [RE]: RE:
Date: 13 Aug 2023 06:35:14 -0400
Message-ID: <20230813063514.B8E6EE64E3FA5983@eba.ufmg.br>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on carretel/UFMG(Release 10.0.1FP3|August 09, 2019) at
 13-08-2023 07:35:15,
	Serialize by Router on carretel/UFMG(Release 10.0.1FP3|August 09, 2019) at
 13-08-2023 07:54:26,
	Serialize complete at 13-08-2023 07:54:26
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="utf-8"

=E6=82=A8=E5=A5=BD=EF=BC=8C=EF=BC=9A=E6=82=A8=E7=9F=A5=E9=81=93=EF=BC=8C=E5=
=8F=AA=E6=9C=89=E5=88=9B=E9=80=A0=E5=A4=9A=E7=A7=8D=E6=94=B6=E5=85=A5=E6=9D=
=A5=E6=BA=90=EF=BC=8C=E6=82=A8=E6=89=8D=E8=83=BD=E5=AE=9E=E7=8E=B0=E8=B4=A2=
=E5=8A=A1=E8=87=AA=E7=94=B1=E3=80=82
=E6=88=91=E6=9C=89=E4=B8=80=E4=BB=BD=E5=95=86=E4=B8=9A=E6=8A=95=E8=B5=84=E7=
=BB=84=E5=90=88=E6=8F=90=E6=A1=88=EF=BC=8C=E5=B0=86=E4=B8=BA=E6=88=91=E4=BB=
=AC=E5=8F=8C=E6=96=B9=E5=B8=A6=E6=9D=A5=E7=BB=8F=E6=B5=8E=E5=88=A9=E7=9B=8A=
=EF=BC=8C=E6=88=91=E5=B8=8C=E6=9C=9B=E5=AE=83=E8=83=BD=E5=90=B8=E5=BC=95=E6=
=82=A8=E3=80=82 =E8=AF=B7=E6=8E=A5=E5=8F=97=E6=88=91=E5=AF=B9=E6=9C=AA=E7=
=BB=8F=E6=82=A8=E5=90=8C=E6=84=8F=E5=8F=91=E9=80=81=E7=94=B5=E5=AD=90=E9=82=
=AE=E4=BB=B6=E7=9A=84=E6=AD=89=E6=84=8F=E3=80=82
=E6=88=91=E7=9B=B8=E4=BF=A1=E6=82=A8=E6=98=AF=E4=B8=80=E4=BD=8D=E5=A4=87=E5=
=8F=97=E5=B0=8A=E6=95=AC=E7=9A=84=E4=BA=BA=E5=A3=AB=EF=BC=8C=E8=80=83=E8=99=
=91=E5=88=B0=E6=88=91=E5=9C=A8=E8=B0=A8=E6=85=8E=E5=AF=BB=E6=89=BE=E8=83=BD=
=E5=A4=9F=E5=8D=8F=E5=8A=A9=E6=88=91=E6=88=90=E5=8A=9F=E6=89=A7=E8=A1=8C=E8=
=AF=A5=E9=A1=B9=E7=9B=AE=E7=9A=84=E6=9C=89=E8=83=BD=E5=8A=9B=E7=9A=84=E5=A4=
=96=E5=9B=BD=E5=90=88=E4=BD=9C=E4=BC=99=E4=BC=B4=E6=9C=9F=E9=97=B4=EF=BC=8C=
=E4=BB=8E=E7=BD=91=E7=BB=9C=E4=B8=8A=E7=9A=84=E4=BA=BA=E6=B0=91=E6=90=9C=E7=
=B4=A2=E6=95=B0=E6=8D=AE=E5=BA=93=E4=B8=AD=E8=8E=B7=E5=8F=96=E4=BA=86=E6=82=
=A8=E7=9A=84=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E8=81=94=E7=B3=BB=E4=BF=A1=
=E6=81=AF=E3=80=82
=E8=99=BD=E7=84=B6=EF=BC=8C=E6=88=91=E4=B8=8D=E7=9F=A5=E9=81=93=E4=BD=A0=E5=
=AF=B9=E4=BA=8B=E6=83=85=E7=9A=84=E7=86=9F=E6=82=89=E7=A8=8B=E5=BA=A6=EF=BC=
=8C=E4=BD=86=E5=B0=B1=E5=83=8F=E6=88=91=E8=AF=B4=E7=9A=84=EF=BC=8C=E6=88=91=
=E6=9C=89=E4=B8=80=E4=B8=AA=E8=B0=A8=E6=85=8E=E7=9A=84=E5=BB=BA=E8=AE=AE=E7=
=BB=99=E4=BD=A0=E3=80=82 =E7=84=B6=E8=80=8C=EF=BC=8C=E8=BF=99=E4=B8=8D=E6=
=98=AF=E5=BC=BA=E5=88=B6=E6=80=A7=E7=9A=84=EF=BC=8C=E6=88=91=E4=B9=9F=E4=B8=
=8D=E4=BC=9A=E4=BB=A5=E4=BB=BB=E4=BD=95=E6=96=B9=E5=BC=8F=E5=BC=BA=E8=BF=AB=
=E6=82=A8=E8=BF=9D=E8=83=8C=E8=87=AA=E5=B7=B1=E7=9A=84=E6=84=8F=E6=84=BF=E5=
=85=91=E7=8E=B0=EF=BC=8C=E4=BD=86=E6=88=91=E5=B8=8C=E6=9C=9B=E6=82=A8=E6=84=
=BF=E6=84=8F=E4=BA=86=E8=A7=A3=E6=9B=B4=E5=A4=9A=E4=BF=A1=E6=81=AF=E5=B9=B6=
=E8=80=83=E8=99=91=E6=88=91=E7=9A=84=E6=8F=90=E8=AE=AE=E3=80=82
=E5=A6=82=E6=9E=9C=E6=9C=89=E5=85=B4=E8=B6=A3=EF=BC=8C=E8=AF=B7=E9=80=9A=E8=
=BF=87=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E4=B8=8E=E6=88=91=E8=81=94=E7=B3=
=BB=E4=BB=A5=E8=8E=B7=E5=8F=96=E6=9B=B4=E5=A4=9A=E4=BF=A1=E6=81=AF=EF=BC=9A=
dianedavis@impactfinancialgroupinc.com =E4=BA=86=E8=A7=A3=E6=9B=B4=E5=A4=9A=
=E8=AF=A6=E7=BB=86=E4=BF=A1=E6=81=AF=E5=92=8C=E7=A8=8B=E5=BA=8F=E3=80=82


