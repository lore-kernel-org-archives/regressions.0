Received: from secorceshy.kaktuscicekcilik.com (secorceshy.kaktuscicekcilik.com [193.233.182.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CE42F4F
	for <regressions@lists.linux.dev>; Thu,  5 May 2022 22:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=kaktuscicekcilik.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; i=min.pow@kaktuscicekcilik.com;
 bh=tkaIBCKkiJJCiBVgJWtPS6S5mbI=;
 b=QH/F0FtrpBHZZlzWGeLxB24O9TErULAmGnsXcghuFFSbaBk5+8cAnQ91LXDWO+lfPs04YYmpc0rZ
   DIYQsU/aKwoUa867xxokxRnEE+gKQ5EF2L5N5Dg25TnpNcl8XcN7x1AQtzu+3EmlI+bsB3NJ3kOK
   LPOTE8vX1Os0mWe4+cr7D6cUrDc7IuSw4zwm2tVr1oUN0KoOMdagTjOiXhFNlNLdGFFt56xvRlwc
   bjjCG0n/ew99CDkLw3iLlIpre3/on1LnyUDHCcA3H+PD1bjrwjnmXWpmYbEovqO8OY3Ubrtokduo
   7LQoTjkq/KPzThPRVel7mW73tu28LF+uq3gr5g==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=kaktuscicekcilik.com;
 b=VEylxr6v9rWC+P/8XyCFd7quVUK+Vh6zGjqu8kKuxoILNBqRdYHmRmfoa88KyxFOP4Gs0Om0qirb
   7KhzX6c1KQaHo0hTIeBZSiI5V6eh+59RciFLnzWgM02AhJ+Y6WYIz1QTv5RxWcQQYfpvpP71XwlM
   JBs3xIXd+Be1dNeA8AlOwewMCB3PhtbK6xVEtCMtyJYFitkTyq9ps7KBvbe8v17misYLZ/lFFG5l
   SjjaquFOILN2A5bwam0Nj2HtcXo+eclsbUBpt0SpQ1AJuIyU8f62Wz/K8OR8DXyqm74sJUM/CDDr
   vZOB9w7SOggSQ/K5dQ9D4tpb563OnGEmuiv56A==;
Reply-To: mustafaayvaz611@gmail.com
From: min.pow@kaktuscicekcilik.com
To: regressions@lists.linux.dev
Subject: =?UTF-8?B?5L2g5aW96Zeu5YCZ77yB?=
Date: 5 May 2022 23:49:27 +0200
Message-ID: <20220505234927.2CC8A623C74F3743@kaktuscicekcilik.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable


=E4=BA=B2=E7=88=B1=E7=9A=84  regressions,

=E6=88=91=E6=98=AF=E5=B7=B2=E6=95=85=E7=BD=97=E4=BC=AF=E7=89=B9=E5=85=88=E7=
=94=9F=E7=9A=84=E7=A7=81=E4=BA=BA=E5=BE=8B=E5=B8=88=E7=A9=86=E6=96=AF=E5=A1=
=94=E6=B3=95=C2=B7=E8=89=BE=E7=93=A6=E5=85=B9=EF=BC=88Mustafa=20
Ayvaz=EF=BC=89=EF=BC=8C=E4=BB=96=E5=9B=A0=E5=9C=A8=E4=B8=AD=E5=9B=BD=E5=87=
=BA=E5=B7=AE=E6=9C=9F=E9=97=B4=E6=84=9F=E6=9F=93=E7=9A=84=E5=86=A0=E7=8A=B6=
=E7=97=85=E6=AF=92=E7=97=85=E8=80=8C=E4=B8=A7=E7=94=9F=E3=80=82=E6=88=91=E8=
=81=94=E7=B3=BB=E4=BD=A0=E5=92=8C=E6=88=91=E4=B8=80=E8=B5=B7=E7=A1=AE=E4=BF=
=9D=E4=B8=80=E7=AC=94=E8=B5=84=E9=87=91=E7=9A=84=E8=BD=AC=E7=A7=BB=EF=BC=9A=
=E5=9B=9B=E7=99=BE=E4=B8=87=E5=9B=9B=E5=8D=81=E4=BA=8C=E4=B8=87=E7=BE=8E=E5=
=85=83=EF=BC=8C=E4=BB=96=E7=95=99=E4=B8=8B=E7=9A=84=E9=81=97=E4=BA=A7=E3=80=
=82

=E6=88=91=E5=B7=B2=E5=BD=BB=E5=BA=95=E5=AF=BB=E6=89=BE=E5=B7=B2=E6=95=85=E5=
=AE=A2=E6=88=B7=E7=9A=84=E8=BF=91=E4=BA=B2=EF=BC=8C=E4=BD=86=E7=94=B1=E4=BA=
=8E=E6=88=91=E6=B2=A1=E6=9C=89=E4=BB=96=E7=9B=AE=E5=89=8D=E7=9A=84=E4=BD=8F=
=E6=89=80=E5=92=8C=E8=81=94=E7=B3=BB=E6=96=B9=E5=BC=8F=E8=80=8C=E5=A4=B1=E8=
=B4=A5=E3=80=82=E5=9C=A8=E6=88=91=E6=90=9C=E7=B4=A2=E7=9A=84=E8=BF=87=E7=A8=
=8B=E4=B8=AD=EF=BC=8C=E6=88=91=E7=A2=B0=E5=88=B0=E4=BA=86=E6=82=A8=E7=9A=84=
=E4=B8=AA=E4=BA=BA=E8=B5=84=E6=96=99=EF=BC=8C=E6=82=A8=E7=9A=84=E5=A7=93=E6=
=B0=8F=E7=9B=B8=E5=90=8C=EF=BC=8C=E5=B9=B6=E4=B8=94=E4=B8=8E
=E8=BF=91=E4=BA=B2=E5=9C=A8=E5=90=8C=E4=B8=80=E5=9C=B0=E7=82=B9=E3=80=82=E6=
=88=91=E5=86=B3=E5=AE=9A=E8=81=94=E7=B3=BB=E4=BD=A0=EF=BC=8C=E5=B9=B6=E6=8A=
=8A=E4=BD=A0=E5=BD=93=E4=BD=9C=E7=9C=9F=E6=AD=A3=E7=9A=84=E8=BF=91=E4=BA=B2=
=E3=80=82

=E6=88=91=E5=BE=81=E6=B1=82=E6=82=A8=E7=9A=84=E5=90=8C=E6=84=8F=EF=BC=8C=E5=
=B0=86=E6=82=A8=E4=BD=9C=E4=B8=BA=E6=88=91=E5=B7=B2=E6=95=85=E5=AE=A2=E6=88=
=B7=E7=9A=84=E8=BF=91=E4=BA=B2=EF=BC=8C=E5=9B=A0=E4=B8=BA=E4=BD=A0=E4=BB=AC=
=E4=BF=A9=E7=9A=84=E5=A7=93=E6=B0=8F=E7=9B=B8=E5=90=8C=E3=80=82=E7=84=B6=E5=
=90=8E=EF=BC=8C=E8=B5=84=E9=87=91=E5=B0=86=E4=BD=9C=E4=B8=BA=E5=8F=97=E7=9B=
=8A=E4=BA=BA=E8=BD=AC=E7=A7=BB=E7=BB=99=E6=82=A8=EF=BC=8C=E5=B9=B6=E6=A0=B9=
=E6=8D=AE=E5=BB=BA=E8=AE=AE=E7=9A=84=E5=88=86=E4=BA=AB=E6=A8=A1=E5=BC=8F/=
=E6=AF=94=E4=BE=8B=20
60:40 =E5=88=86=E4=BA=AB=EF=BC=8C=E5=8D=B3=E6=88=91=E4=B8=BA 60%=EF=BC=8C=
=E6=82=A8=E4=B8=BA 40%=E3=80=82=E8=AF=B7=E8=81=94=E7=B3=BB=E6=88=91=E4=BA=
=86=E8=A7=A3=E6=9B=B4=E5=A4=9A=E8=AF=A6=E6=83=85=E3=80=82

=E9=97=AE=E5=80=99
=E7=A9=86=E6=96=AF=E5=A1=94=E6=B3=95=C2=B7=E8=89=BE=E7=93=A6=E5=85=B9
